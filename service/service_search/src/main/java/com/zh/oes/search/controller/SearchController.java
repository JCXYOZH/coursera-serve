package com.zh.oes.search.controller;

import com.zh.oes.common.utils.Result;
import com.zh.oes.search.service.SearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Api(tags = "课程搜索API接口")
@RestController
@RequestMapping("/user/search")
public class SearchController {

    private SearchService searchService;

    @Autowired
    public void setSearchService(SearchService searchService) {
        this.searchService = searchService;
    }

    @ApiOperation(value = "全量同步课程数据至ES")
    @PostMapping("/syncAll")
    public Result syncAllCourseData() {
        boolean success = searchService.syncAllCourseData();
        return success ? Result.success() : Result.failure().message("同步失败");
    }

    @ApiOperation(value = "课程全文检索")
    @PostMapping("/course")
    public Result searchCourse(@RequestBody Map<String, Object> searchParams) {
        Map<String, Object> result = searchService.searchCourse(searchParams);
        return Result.success(result);
    }
}
