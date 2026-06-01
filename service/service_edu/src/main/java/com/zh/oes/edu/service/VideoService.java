package com.zh.oes.edu.service;

import com.zh.oes.model.entity.edu.Video;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 课程视频 服务类
 * </p>
 */
public interface VideoService extends IService<Video> {
    // 根据id删除小节视频,底层会调用vod删除阿里云端的视频
    boolean deleteVideo(Long videoId);

    // 根据章节id删除小节视频
    boolean deleteVideoByChapterId(Long chapterId);

    // 根据课程id删除小节
    boolean deleteVideoByCourseId(Long courseId);

    // 修改小节
    boolean updateVideo(Video video);
}
