package com.bi.aibi.model.dto.user;

import lombok.Data;

/**
 * 个人详情信息的更新DTO
 */
@Data
public class UserDetailRequest {

    private String userName;

    private String userAvatar;

    private String remark;

    private String sex;

    private Integer age;

    private Long phone;



}
