package com.bincui.smate.global.common.logging.support;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;

public class CachedServletRequest extends HttpServletRequestWrapper {

    public CachedServletRequest(HttpServletRequest request) {
        super(request);
    }
}