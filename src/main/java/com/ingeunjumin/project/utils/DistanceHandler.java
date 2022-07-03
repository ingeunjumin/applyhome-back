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
    public double calculateDistance(double latitude, double longitude, double targetLat, double targetLon){
        double theta = longitude - targetLon;
        double dist = Math.sin(deg2rad(latitude)) * Math.sin(deg2rad(targetLat)) + Math.cos(deg2rad(latitude)) * Math.cos(deg2rad(targetLat)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        dist = dist * 1609.344;
        double km = 0.001;

        return Math.round(dist)*km;
    }

    public double deg2rad(double deg){
        return (deg * Math.PI / 180.0);
    }

    public double rad2deg(double rad){
        return (rad * 180 / Math.PI);
    }
}
