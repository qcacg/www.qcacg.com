package com.qcacg.service.system.impl;

import com.qcacg.entity.ContentEntity;
import com.qcacg.mapper.ContentMapper;
import com.qcacg.service.BaseServiceImpl;
import com.qcacg.service.system.ContentService;
import com.qcacg.util.upload.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;

/**
 * Created by Administrator on 2016/7/4.
 */
@Service
public class ContentServiceImpl extends BaseServiceImpl<ContentEntity> implements ContentService {

    @Autowired
    ContentMapper contentMapper;

//    @Override
//    public List<ContentEntity> findVolumeAndContentByBookId(Long bookId) {
//
//        return this.contentMapper.findVolumeAndContentByBookId(bookId);
//    }

    @Override
    public String saveOrUpdate(ContentEntity entity) {
        String result = "";
        try
        {
            if (entity.getContentId() == null)
            {
                return this.save(entity);

            } else
            {
                result = this.update(entity);
            }
        } catch (Exception e)
        {
            e.printStackTrace();
            return null;
        }
        return result;
    }
}
