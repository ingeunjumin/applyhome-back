package com.ingeunjumin.project.utils;

import org.springframework.stereotype.Component;

@Component
public class DistanceHandler {
    /**
     * Comment  : 원반경 거리 계산
     * @author  : Sangwon Hyun
     * @date    : 2022. 7. 2.
     * @methodName : calculateDistance
     * @returnType : double
     * @param :
     */
    public double calculateDistance(double cn100Lat, double cn100Lon, double areaLat, double areaLon){
        double theta = cn100Lon - areaLon;
        double dist = Math.sin(deg2rad(cn100Lat)) * Math.sin(deg2rad(areaLat)) + Math.cos(deg2rad(cn100Lat)) * Math.cos(deg2rad(areaLat)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        dist = dist * 1609.344;

        return Math.round(dist);
    }

    public double deg2rad(double deg){
        return (deg * Math.PI / 180.0);
    }

    public double rad2deg(double rad){
        return (rad * 180 / Math.PI);
    }
}
