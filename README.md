# Spring Boot Boilerplate

이 프로젝트는 Spring Boot 기반의 웹 애플리케이션 개발을 위한 보일러플레이트입니다. RESTful API 개발에 필요한 기본적인 설정과 모듈을 포함하고 있어, 새로운 프로젝트를 빠르게 시작할 수 있도록 돕습니다.

## 🚀 기술 스택

*   **언어**: Java 21
*   **프레임워크**: Spring Boot 3.5.3
*   **빌드 도구**: Gradle
*   **데이터베이스**: 
    *   개발/테스트: H2 Database (인메모리)
    *   운영/배포: MySQL (Docker Compose를 통해 연동)
*   **ORM**: Spring Data JPA
*   **보안**: Spring Security
*   **API 문서화**: SpringDoc OpenAPI (Swagger UI)
*   **유틸리티**: Lombok, Spring Boot DevTools
*   **컨테이너**: Docker

## ✨ 주요 기능

*   **RESTful API**: Spring Web을 이용한 RESTful API 개발 환경.
*   **데이터베이스 연동**: Spring Data JPA를 활용한 데이터베이스 CRUD 작업.
*   **보안**: Spring Security를 통한 기본적인 인증/인가 설정.
*   **유효성 검증**: Spring Validation을 이용한 요청 데이터 유효성 검증.
*   **API 문서 자동화**: SpringDoc OpenAPI를 통해 Swagger UI 기반의 API 문서를 자동으로 생성하고 제공합니다. (`/swagger-ui.html` 또는 `/api-docs`로 접근)
*   **환경별 설정**: `application.yml`을 통해 `local` (H2) 및 `dev` (MySQL) 프로파일을 분리하여 환경에 따른 설정을 관리합니다.
*   **Docker 지원**: Docker 및 Docker Compose를 사용하여 애플리케이션 및 데이터베이스 환경을 쉽게 구축하고 실행할 수 있습니다.

## 🛠️ 시작하기

### 필수 요구사항

*   Java Development Kit (JDK) 21 이상
*   Gradle (선택 사항, Gradle Wrapper 포함)
*   Docker 및 Docker Compose (Docker 환경에서 실행 시)

### 프로젝트 클론

```bash
git clone https://github.com/your-username/your-repository-name.git
cd your-repository-name
```
(참고: `your-username/your-repository-name`은 실제 저장소 URL로 변경해주세요.)

### 애플리케이션 실행

#### 1. 로컬 환경 (H2 Database)

인메모리 H2 데이터베이스를 사용하여 빠르게 애플리케이션을 실행할 수 있습니다.

```bash
./gradlew bootRun
```

애플리케이션이 시작되면 `http://localhost:8080`으로 접근할 수 있습니다. H2 콘솔은 `http://localhost:8080/h2-console`에서 접근 가능합니다.

#### 2. Docker 환경 (MySQL Database)

Docker Compose를 사용하여 MySQL 데이터베이스와 함께 애플리케이션을 실행합니다.

**주의**: `docker-compose.yml` 파일 내의 `DB_PASSWORD` 및 `MYSQL_ROOT_PASSWORD`를 **반드시 강력하고 고유한 비밀번호로 변경**해야 합니다.

```yaml
# docker-compose.yml (일부 발췌)
services:
  app:
    environment:
      - DB_PASSWORD=your_secure_password # <-- 이 부분을 변경하세요
  db:
    environment:
      - MYSQL_ROOT_PASSWORD=your_secure_password # <-- 이 부분을 변경하세요
```

비밀번호를 변경한 후, 다음 명령어를 실행합니다:

```bash
docker-compose up --build
```

애플리케이션이 시작되면 `http://localhost:8080`으로 접근할 수 있습니다. MySQL 데이터베이스는 Docker 컨테이너 내에서 실행됩니다.

### 새 프로젝트 시작하기 (보일러플레이트 활용)

이 보일러플레이트를 기반으로 새로운 프로젝트를 시작하려면 다음 단계를 따르세요:

1.  **보일러플레이트 클론**:
    ```bash
    git clone https://github.com/pgkim42/spring-boot-boilerplate.git my-new-project
    ```
    `my-new-project`는 새 프로젝트의 이름으로 변경하세요.

2.  **새 프로젝트 디렉토리로 이동**:
    ```bash
    cd my-new-project
    ```

3.  **기존 Git 기록 삭제**:
    이 보일러플레이트의 Git 기록을 새 프로젝트에 가져오고 싶지 않다면, `.git` 디렉토리를 삭제하여 기존 Git 연결을 끊습니다.
    ```bash
    rm -rf .git  # Linux/macOS
    # rmdir /s /q .git  # Windows (또는 파일 탐색기에서 .git 폴더 삭제)
    ```

4.  **새 Git 저장소 초기화**:
    이제 이 폴더를 새 프로젝트를 위한 독립적인 Git 저장소로 초기화합니다.
    ```bash
    git init
    ```

5.  **새 프로젝트 파일 추가 및 커밋**:
    새로운 Git 저장소에 현재 프로젝트 파일들을 추가하고 첫 커밋을 합니다.
    ```bash
    git add .
    git commit -m "Initial commit for my new project"
    ```

6.  **GitHub에 새 원격 저장소 생성**:
    GitHub 웹사이트에서 이 새 프로젝트를 위한 **새로운 빈 저장소**를 생성합니다. 이때 README, .gitignore, 라이선스 파일 추가 옵션은 **체크하지 마세요.**

7.  **새 원격 저장소 연결**:
    GitHub에서 새로 생성한 저장소의 URL을 사용하여 원격 저장소를 연결합니다.
    ```bash
    git remote add origin https://github.com/YOUR_USERNAME/my-new-project.git
    ```
    (`YOUR_USERNAME/my-new-project.git` 부분은 새로 생성한 저장소의 실제 URL로 변경해야 합니다.)

8.  **새 원격 저장소로 푸시**:
    ```bash
    git branch -M main
    git push -u origin main
    ```

9.  **(선택 사항) 프로젝트 정보 업데이트**:
    `build.gradle` 파일에서 `group`과 `version` 같은 프로젝트 정보를 새 프로젝트에 맞게 변경하는 것이 좋습니다.

## 📂 프로젝트 구조

```
.
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── io/github/pgkim42/boilerplate/
│   │   │       ├── BoilerplateApplication.java  # 메인 애플리케이션 클래스
│   │   │       ├── config/                      # 설정 관련 클래스
│   │   │       ├── controller/                  # REST API 컨트롤러
│   │   │       ├── dto/                         # 데이터 전송 객체 (DTO)
│   │   │       ├── entity/                      # JPA 엔티티
│   │   │       ├── exception/                   # 커스텀 예외 클래스
│   │   │       ├── repository/                  # 데이터베이스 접근 (JPA Repository)
│   │   │       ├── service/                     # 비즈니스 로직 서비스
│   │   │       └── util/                        # 유틸리티 클래스
│   │   └── resources/
│   │       └── application.yml                  # 애플리케이션 설정 파일
│   └── test/
│       └── java/
│           └── io/github/pgkim42/boilerplate/
│               └── BoilerplateApplicationTests.java # 테스트 클래스
├── build.gradle                                 # Gradle 빌드 설정 파일
├── docker-compose.yml                           # Docker Compose 설정 파일
├── Dockerfile                                   # Docker 이미지 빌드 파일
└── HELP.md                                      # Spring Boot 관련 공식 문서 링크
```