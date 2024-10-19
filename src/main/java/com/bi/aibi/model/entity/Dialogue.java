package com.bi.aibi.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

import com.bi.aibi.model.enums.SparkEnum;
import lombok.Data;

import javax.xml.parsers.SAXParser;

/**
 * 
 * @TableName dialogue
 */
@TableName(value ="dialogue")
@Data
public class Dialogue implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 
     */
    private Long userId;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private String content;

    /**
     * 1：提问内容
     * 2：响应内容
     */
    private SparkEnum type;

    /**
     * 
     */
    private Long targetId;

    /**
     * 
     */
    private Long roomId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}