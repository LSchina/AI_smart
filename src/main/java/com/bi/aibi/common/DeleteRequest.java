package com.bi.aibi.common;

import java.io.Serializable;
import lombok.Data;

/**
 * 删除请求
 *
 * @author lishuo
 * @from
 */
@Data
public class DeleteRequest implements Serializable {

    /**
     * id
     */
    private Long id;

    private static final long serialVersionUID = 1L;
}