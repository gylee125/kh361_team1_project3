package com.mealkit.member;

import java.util.Date;

import lombok.Data;

@Data
public class PointDTO {
    
    private String mId;
    private int currentPoint;
    private Date updateDate;
    
}
