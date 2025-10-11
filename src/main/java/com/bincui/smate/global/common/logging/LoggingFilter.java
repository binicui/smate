package com.bincui.smate.global.common.logging;

import com.bincui.smate.global.common.logging.support.CachedServletRequest;
import com.bincui.smate.global.common.logging.support.CachedServletResponse;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.MDC;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.UUID;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class LoggingFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        MDC.put("traceId", UUID.randomUUID().toString());
        if (isAsyncDispatch(request)) {
            filterChain.doFilter(request, response);
        } else {
            doFilterWithCaching(new CachedServletRequest(request), new CachedServletResponse(response), filterChain);
        }
        MDC.clear();
    }

    private void doFilterWithCaching(CachedServletRequest request, CachedServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        try {
            filterChain.doFilter(request, response);
        } finally {
            response.copyBodyToResponse();
        }
    }
}