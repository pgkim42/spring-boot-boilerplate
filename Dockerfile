# 1. 빌드 스테이지: JDK 21 슬림 버전을 기반으로 프로젝트를 빌드합니다.
# 수정: 'as'를 대문자 'AS'로 변경 (경고 메시지 해결)
FROM openjdk:21-jdk-slim AS builder
WORKDIR /workspace/app

# Gradle 관련 파일들을 먼저 복사하여 의존성 레이어를 캐싱합니다.
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
RUN ./gradlew dependencies

# 소스 코드를 복사하고, 테스트를 제외하고 빌드합니다.
COPY src src
RUN ./gradlew build -x test

# 2. 실행 스테이지: 빌드된 Jar 파일만 가져와 최소한의 JRE 환경에서 실행합니다.
# 수정: 존재하지 않는 '21-jre-slim'을 정확한 이미지 이름인 '21-slim'으로 변경 (에러 해결)
FROM openjdk:21-slim
WORKDIR /app

# 빌드 스테이지에서 생성된 Jar 파일을 복사합니다.
COPY --from=builder /workspace/app/build/libs/*.jar app.jar

# 컨테이너가 시작될 때 이 명령어를 실행합니다.
ENTRYPOINT ["java", "-jar", "app.jar"]