package com.zh.oes.edu.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zh.oes.common.base.exception.OESException;
import com.zh.oes.common.base.client.VodClient;
import com.zh.oes.edu.mapper.VideoMapper;
import com.zh.oes.edu.service.VideoService;
import com.zh.oes.model.entity.edu.Video;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程视频 服务实现类
 * </p>
 */
@Service
public class VideoServiceImpl extends ServiceImpl<VideoMapper, Video> implements VideoService {

    private VodClient vodClient;

    @Autowired
    public void setVodClient(VodClient vodClient) {
        this.vodClient = vodClient;
    }

    /**
     * 根据id删除小节视频,底层会调用vod删除阿里云端的视频
     *
     * @param videoId 要删除的小节id
     * @return 是否删除成功
     */
    @Override
    public boolean deleteVideo(Long videoId) {
        Video video = baseMapper.selectById(videoId);
        if (video == null) return false;

        String videoPath = video.getVideoSourceId();

        if (StringUtils.hasText(videoPath)) {
            if (!vodClient.remoteDelete(videoPath)) {
                throw new OESException("删除本地视频失败");
            }
        }

        return baseMapper.deleteById(videoId) >= 1;
    }

    /**
     * 根据章节id删除小节视频
     *
     * @param chapterId 章节id
     * @return 是否删除成功
     */
    @Override
    public boolean deleteVideoByChapterId(Long chapterId) {

        LambdaQueryWrapper<Video> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Video::getChapterId, chapterId);

        List<Video> videoList = baseMapper.selectList(wrapper);
        if (videoList.isEmpty()) return true;

        List<String> videoPathList = videoList.stream()
                .map(Video::getVideoSourceId)
                .filter(StringUtils::hasText)
                .collect(Collectors.toList());

        if (!videoPathList.isEmpty()) {
            if (!vodClient.remoteBatchDelete(videoPathList)) {
                throw new OESException("批量删除本地视频失败");
            }
        }

        return baseMapper.delete(wrapper) >= 1;
    }

    /**
     * 根据课程id删除小节(视频)
     *
     * @param courseId 要删除的课程id
     * @return 是否删除成功
     */
    @Override
    public boolean deleteVideoByCourseId(Long courseId) {

        LambdaQueryWrapper<Video> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Video::getCourseId, courseId);

        List<Video> videoList = baseMapper.selectList(wrapper);
        if (videoList.isEmpty()) return true;

        List<String> videoPathList = videoList.stream()
                .map(Video::getVideoSourceId)
                .filter(StringUtils::hasText)
                .collect(Collectors.toList());

        if (!videoPathList.isEmpty()) {
            if (!vodClient.remoteBatchDelete(videoPathList)) {
                throw new OESException("批量删除本地视频失败");
            }
        }

        return baseMapper.delete(wrapper) >= 1;
    }

    /**
     * 修改小节信息
     *
     * @param video 要修改的小节实体
     * @return 是否修改成功
     */
    @Override
    public boolean updateVideo(Video video) {
        // 先获取数据库中的数据
        Video databaseVideo = baseMapper.selectById(video.getId());
        // 如果databaseVideo中的视频地址和video中的视频地址不同,则应该先删除阿里云端视频数据
        if (!databaseVideo.getVideoSourceId().equals(video.getVideoSourceId())) {
            // 删除阿里云端视频
        }
        // 修改数据库信息
        return baseMapper.updateById(video) >= 1;
    }
}
