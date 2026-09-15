package com.zh.oes.search.client;

import com.zh.oes.common.utils.Result;
import com.zh.oes.model.vo.edu.admin.CourseEsVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "service-edu", contextId = "eduClientForSearch")
public interface EduClient {

    @GetMapping("/user/edu/course/remoteGetAllPublishedCourse")
    List<CourseEsVO> remoteGetAllPublishedCourse();

    @GetMapping("/user/edu/course/remoteGetCourseById/{courseId}")
    CourseEsVO remoteGetCourseById(@PathVariable("courseId") Long courseId);
}
