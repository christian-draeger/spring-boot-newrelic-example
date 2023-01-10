package com.example.app

import org.springframework.boot.context.event.ApplicationReadyEvent
import org.springframework.context.event.EventListener
import org.springframework.stereotype.Service

@Service
class LogOnApplicationReadyService {

    @EventListener(ApplicationReadyEvent::class)
    fun createTestData() {
        logger.info("Application is ready")

        repeat(random) {
            logger.error("example ERROR log - executed $it times")
        }
        repeat(random) {
            logger.warn("example WARN log - executed $it times")
        }
        repeat(random) {
            logger.debug("example DEBUG log - executed $it times")
        }
    }
}

val random get() = (1..10).random()
