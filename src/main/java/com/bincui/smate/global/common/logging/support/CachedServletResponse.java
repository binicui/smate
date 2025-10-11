package com.bincui.smate.global.common.logging.support;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.util.ContentCachingResponseWrapper;

public class CachedServletResponse extends ContentCachingResponseWrapper {

    public CachedServletResponse(HttpServletResponse response) {
        super(response);
    }
}