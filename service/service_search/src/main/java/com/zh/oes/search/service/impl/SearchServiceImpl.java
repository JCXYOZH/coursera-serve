package com.zh.oes.search.service.impl;

import com.zh.oes.model.vo.edu.admin.CourseEsVO;
import com.zh.oes.search.client.EduClient;
import com.zh.oes.search.service.SearchService;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.CreateIndexRequest;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SearchServiceImpl implements SearchService {

    private static final String INDEX_NAME = "course_index_v1";

    @Autowired
    private RestHighLevelClient client;

    @Autowired
    private EduClient eduClient;

    @Override
    public boolean syncAllCourseData() {
        try {
            GetIndexRequest getIndexRequest = new GetIndexRequest(INDEX_NAME);
            boolean exists = client.indices().exists(getIndexRequest, RequestOptions.DEFAULT);
            // 如果索引已存在，先删除旧索引
            if (exists) {
                org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest deleteRequest =
                        new org.elasticsearch.action.admin.indices.delete.DeleteIndexRequest(INDEX_NAME);
                client.indices().delete(deleteRequest, RequestOptions.DEFAULT);
                System.out.println("【全量同步】已删除旧索引");
            }

            // 重新创建索引
            createCourseIndex();
            System.out.println("【全量同步】已创建新索引");

            List<CourseEsVO> courseList = eduClient.remoteGetAllPublishedCourse();
            System.out.println("【全量同步】从数据库获取到课程数量: " + (courseList != null ? courseList.size() : 0));

            if (courseList == null || courseList.isEmpty()) {
                return true;
            }

            BulkRequest bulkRequest = new BulkRequest();
            for (CourseEsVO course : courseList) {
                bulkRequest.add(new IndexRequest(INDEX_NAME)
                        .id(String.valueOf(course.getId()))
                        .source(convertToMap(course), XContentType.JSON));
            }

            BulkResponse bulkResponse = client.bulk(bulkRequest, RequestOptions.DEFAULT);
            return !bulkResponse.hasFailures();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteCourseById(Long courseId) {
        try {
            org.elasticsearch.action.delete.DeleteRequest request =
                    new org.elasticsearch.action.delete.DeleteRequest(INDEX_NAME, String.valueOf(courseId));
            client.delete(request, RequestOptions.DEFAULT);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean syncCourseById(CourseEsVO course) {
        try {
            // 判断：如果对象为空，或者逻辑删除为1，或者状态不为1(未发布)，则从ES中删除
            if (course == null ||
                    (course.getIsDeleted() != null && course.getIsDeleted() == 1) ||
                    course.getStatus() == null || course.getStatus() != 1) {

                // 如果 course 不为空才执行删除，避免空指针
                if (course != null && course.getId() != null) {
                    return deleteCourseById(course.getId());
                }
                return false;
            }

            // 正常数据，更新到ES
            IndexRequest request = new IndexRequest(INDEX_NAME)
                    .id(String.valueOf(course.getId()))
                    .source(convertToMap(course), XContentType.JSON);
            client.index(request, RequestOptions.DEFAULT);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Map<String, Object> convertToMap(CourseEsVO course) {
        Map<String, Object> jsonMap = new HashMap<>();
        jsonMap.put("id", course.getId());
        jsonMap.put("title", course.getTitle());
        jsonMap.put("cover", course.getCover());
        jsonMap.put("description", course.getDescription());
        jsonMap.put("price", course.getPrice());
        jsonMap.put("sales", course.getSaleCount());
        jsonMap.put("viewCount", course.getViewCount());
        jsonMap.put("lessonNum", course.getLessonNum());
        jsonMap.put("status", "Normal");
        jsonMap.put("teacherId", course.getTeacherId());
        jsonMap.put("teacherName", course.getTeacherName());
        jsonMap.put("subjectParentId", course.getSubjectId());
        jsonMap.put("subjectId", course.getTypeId());
        // 将 Date 转为时间戳存入 ES
        if (course.getCreateTime() != null) {
            jsonMap.put("createTime", course.getCreateTime().getTime());
        }
        return jsonMap;
    }

    private void createCourseIndex() throws IOException {
        CreateIndexRequest request = new CreateIndexRequest(INDEX_NAME);
        request.settings(Settings.builder()
                .put("index.number_of_shards", 1)
                .put("index.number_of_replicas", 0)
        );
        String mapping = "{\n" +
                "  \"mappings\": {\n" +
                "    \"properties\": {\n" +
                "      \"id\": { \"type\": \"keyword\" },\n" +
                "      \"title\": { \"type\": \"text\", \"analyzer\": \"ik_max_word\", \"search_analyzer\": \"ik_smart\" },\n" +
                "      \"cover\": { \"type\": \"keyword\" },\n" +
                "      \"description\": { \"type\": \"text\", \"analyzer\": \"ik_max_word\" },\n" +
                "      \"price\": { \"type\": \"double\" },\n" +
                "      \"sales\": { \"type\": \"integer\" },\n" +
                "      \"viewCount\": { \"type\": \"integer\" },\n" +
                "      \"lessonNum\": { \"type\": \"integer\" },\n" +
                "      \"status\": { \"type\": \"keyword\" },\n" +
                "      \"teacherId\": { \"type\": \"keyword\" },\n" +
                "      \"teacherName\": { \"type\": \"keyword\" },\n" +
                "      \"subjectParentId\": { \"type\": \"keyword\" },\n" +
                "      \"subjectId\": { \"type\": \"keyword\" },\n" +
                "      \"createTime\": { \"type\": \"date\" }\n" +
                "    }\n" +
                "  }\n" +
                "}";
        request.source(mapping, XContentType.JSON);
        client.indices().create(request, RequestOptions.DEFAULT);
    }

    @Override
    public Map<String, Object> searchCourse(Map<String, Object> searchParams) {
        try {
            String keyword = (String) searchParams.getOrDefault("keyword", "");
            // 获取一级和二级分类 ID
            String subjectParentId = searchParams.get("subjectParentId") != null ? String.valueOf(searchParams.get("subjectParentId")) : null;
            String subjectId = searchParams.get("subjectId") != null ? String.valueOf(searchParams.get("subjectId")) : null;
            String sortField = (String) searchParams.getOrDefault("sortField", "sales");
            String sortOrder = (String) searchParams.getOrDefault("sortOrder", "desc");
            int current = searchParams.get("current") != null ? Integer.parseInt(String.valueOf(searchParams.get("current"))) : 1;
            int size = searchParams.get("size") != null ? Integer.parseInt(String.valueOf(searchParams.get("size"))) : 10;

            SearchRequest searchRequest = new SearchRequest(INDEX_NAME);
            SearchSourceBuilder sourceBuilder = new SearchSourceBuilder();

            BoolQueryBuilder boolQueryBuilder = QueryBuilders.boolQuery();

            if (StringUtils.hasText(keyword)) {
                boolQueryBuilder.must(QueryBuilders.multiMatchQuery(keyword)
                        .field("title", 3.0f)
                        .field("description"));
            }

            boolQueryBuilder.filter(QueryBuilders.termQuery("status", "Normal"));
            // 添加一级分类过滤
            if (StringUtils.hasText(subjectParentId)) {
                boolQueryBuilder.filter(QueryBuilders.termQuery("subjectParentId", subjectParentId));
            }
            // 添加二级分类过滤
            if (StringUtils.hasText(subjectId)) {
                boolQueryBuilder.filter(QueryBuilders.termQuery("subjectId", subjectId));
            }

            sourceBuilder.query(boolQueryBuilder);
            sourceBuilder.from((current - 1) * size);
            sourceBuilder.size(size);

            if (StringUtils.hasText(sortField)) {
                sourceBuilder.sort(sortField, sortOrder.equalsIgnoreCase("asc") ? SortOrder.ASC : SortOrder.DESC);
            }

            HighlightBuilder highlightBuilder = new HighlightBuilder();
            highlightBuilder.field("title")
                    .preTags("<em style='color:red'>")
                    .postTags("</em>");
            sourceBuilder.highlighter(highlightBuilder);

            searchRequest.source(sourceBuilder);
            SearchResponse response = client.search(searchRequest, RequestOptions.DEFAULT);

            List<Map<String, Object>> records = new ArrayList<>();
            for (SearchHit hit : response.getHits().getHits()) {
                Map<String, Object> sourceAsMap = hit.getSourceAsMap();

                // 使用的泛型类型为 Map<String, HighlightField>
                Map<String, HighlightField> highlightFields = hit.getHighlightFields();
                HighlightField titleField = highlightFields.get("title");
                if (titleField != null) {
                    sourceAsMap.put("title", titleField.getFragments()[0].string());
                }
                records.add(sourceAsMap);
            }

            Map<String, Object> result = new HashMap<>();
            long total = response.getHits().getTotalHits().value;
            result.put("records", records);
            result.put("total", total);
            result.put("current", current);
            result.put("size", size);
            result.put("pages", (total + size - 1) / size);
            System.out.println("ES查询结果: " + com.alibaba.fastjson.JSON.toJSONString(result));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return new HashMap<>();
        }
    }
}
