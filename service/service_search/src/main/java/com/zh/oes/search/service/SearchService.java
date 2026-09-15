package com.zh.oes.search.service;

import com.zh.oes.model.vo.edu.admin.CourseEsVO;
import java.util.Map;

public interface SearchService {
    boolean syncAllCourseData();
    boolean syncCourseById(CourseEsVO course);
    boolean deleteCourseById(Long courseId);
    Map<String, Object> searchCourse(Map<String, Object> searchParams);
}
