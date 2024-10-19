package com.bi.aibi.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName dialogue_room
 */
@TableName(value ="dialogue_room")
@Data
public class DialogueRoom implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    /**
     * 
     */
    private Date createTime;

    /**
     * 
     */
    private Long userId;

    /**
     * 
     */
    private Integer requestNum;

    /**
     * 
     */
    private String title;

    /**
     * 是否有效
     */
    private Integer effect;

    /**
     * 逻辑删除
     */
    private Integer isDelete;

    /**
     * 
     */
    private String roomAvatar;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}