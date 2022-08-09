package com.mealkit.member;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PointDTO {
    
    private String mId;
    private int currentPoint;
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date updateDate;
    
}
