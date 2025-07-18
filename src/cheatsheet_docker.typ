#import "./templates/conf.typ": *

#show: template.with(
  title: "Docker 치트시트 (심화)",
  header: [#datetime.today().display()],
  footer: "",
)

= 1. 컨테이너 생명주기 관리

- `docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`: 새 컨테이너를 생성하고 실행합니다.
  - `-d, --detach`: 백그라운드에서 실행.
  - `-p, --publish <host_port>:<container_port>`: 포트 포워딩.
  - `-v, --volume <host_path>:<container_path>[:ro]`: 볼륨 마운트. `:ro`는 읽기 전용.
  - `--name <name>`: 컨테이너 이름 지정.
  - `-e, --env <key>=<value>`: 환경 변수 설정.
  - `--rm`: 컨테이너 종료 시 자동으로 삭제.
  - `-it, --interactive --tty`: 상호작용 가능한 TTY 할당 (셸 접속 시 필수).
  - `--network <network>`: 컨테이너를 특정 네트워크에 연결.
  - `--restart <policy>`: 재시작 정책 설정 (`no`, `on-failure`, `unless-stopped`, `always`).
- `docker ps`: 실행 중인 컨테이너 목록을 표시합니다.
  - `-a, --all`: 중지된 컨테이너를 포함한 모든 컨테이너를 표시합니다.
  - `-q, --quiet`: 컨테이너 ID만 표시합니다.
- `docker stop $(docker ps -aq)`: 모든 컨테이너를 중지합니다.
- `docker start <container>`: 중지된 컨테이너를 시작합니다.
- `docker restart <container>`: 컨테이너를 재시작합니다.
- `docker rm $(docker ps -aq)`: 모든 컨테이너를 삭제합니다.
  - `-f, --force`: 실행 중인 컨테이너를 강제로 삭제합니다.
  - `-v, --volumes`: 컨테이너와 연결된 볼륨도 함께 삭제합니다.
- `docker logs <container>`: 컨테이너의 로그를 확인합니다.
  - `-f, --follow`: 실시간으로 로그를 스트리밍합니다.
  - `--tail <N>`: 마지막 N줄의 로그만 표시합니다.
  - `--since <timestamp>`: 특정 시간 이후의 로그만 표시합니다.
- `docker exec -it <container> <command>`: 실행 중인 컨테이너 내부에서 명령을 실행합니다. (예: `bash`, `sh`)
- `docker inspect <container|image>`: 컨테이너나 이미지의 상세 정보를 JSON 형식으로 표시합니다.
- `docker top <container>`: 컨테이너 내부에서 실행 중인 프로세스를 보여줍니다.
- `docker stats`: 실행 중인 컨테이너의 리소스 사용량(CPU, 메모리 등)을 실시간으로 보여줍니다.
- `docker cp <container>:<src_path> <dest_path>`: 컨테이너와 호스트 간에 파일을 복사합니다.

#pagebreak()

= 2. 이미지 관리

- `docker images`: 로컬에 저장된 이미지 목록을 표시합니다.
- `docker build -t <name>:<tag> <path>`: Dockerfile을 사용하여 이미지를 빌드합니다.
  - `--no-cache`: 빌드 캐시를 사용하지 않고 처음부터 빌드합니다.
  - `--build-arg <key>=<value>`: 빌드 시점에 사용할 수 있는 변수를 전달합니다.
  - `-f, --file <path/to/Dockerfile>`: Dockerfile의 경로를 직접 지정합니다.
- `docker pull <name>[:<tag>]`: 레지스트리에서 이미지를 가져옵니다.
- `docker push <name>[:<tag>]`: 이미지를 레지스트리로 푸시합니다.
- `docker rmi <image>`: 로컬 이미지를 삭제합니다.
  - `docker rmi $(docker images -q -f "dangling=true")`: 사용되지 않는(dangling) 이미지를 모두 삭제합니다.
- `docker tag <source_image> <target_image>`: 이미지에 새로운 태그를 지정합니다.
- `docker history <image>`: 이미지의 레이어 히스토리를 확인합니다.
- `docker save -o <output.tar> <image>`: 이미지를 tar 아카이브로 저장합니다.
- `docker load -i <input.tar>`: tar 아카이브에서 이미지를 로드합니다.

= 3. 네트워크 및 볼륨 관리

- *네트워크*:
  - `docker network ls`: Docker 네트워크 목록을 표시합니다.
  - `docker network create --driver bridge <name>`: 새 브리지 네트워크를 생성합니다.
  - `docker network rm <name>`: 네트워크를 삭제합니다.
  - `docker network inspect <name>`: 네트워크의 상세 정보를 표시합니다.
  - `docker network connect <network> <container>`: 컨테이너를 네트워크에 연결합니다.
- *볼륨*:
  - `docker volume ls`: Docker 볼륨 목록을 표시합니다.
  - `docker volume create <name>`: 새 볼륨을 생성합니다.
  - `docker volume rm <name>`: 볼륨을 삭제합니다.
  - `docker volume inspect <name>`: 볼륨의 상세 정보를 표시합니다.
  - `docker volume prune`: 사용하지 않는 볼륨을 모두 삭제합니다.

= 4. Docker Compose (다중 컨테이너 애플리케이션)

- `docker-compose up`: `docker-compose.yml` 파일에 정의된 모든 서비스를 생성하고 시작합니다.
  - `-d`: 백그라운드에서 실행합니다.
  - `--build`: 시작하기 전에 이미지를 빌드합니다.
  - `--force-recreate`: 컨테이너를 강제로 다시 생성합니다.
- `docker-compose down`: `up`으로 생성된 컨테이너, 네트워크, 볼륨을 중지하고 삭제합니다.
  - `-v, --volumes`: 컨테이너와 함께 볼륨도 삭제합니다.
  - `--rmi all`: 서비스에서 사용된 모든 이미지를 삭제합니다.
- `docker-compose ps`: 서비스의 컨테이너 상태를 표시합니다.
- `docker-compose logs -f <service_name>`: 특정 서비스의 로그를 실시간으로 확인합니다.
- `docker-compose build <service_name>`: 특정 서비스의 이미지를 빌드합니다.
- `docker-compose exec <service_name> <command>`: 실행 중인 서비스 컨테이너 내에서 명령을 실행합니다.
- `docker-compose run --rm <service_name> <command>`: 일회성 명령을 실행하기 위해 서비스를 시작하고, 실행 후 컨테이너를 삭제합니다.
- `docker-compose config`: `docker-compose.yml` 파일의 구성을 확인하고 검증합니다.

= 5. 시스템 정리

- `docker system prune`: 사용하지 않는 모든 리소스(중지된 컨테이너, dangling 이미지, 네트워크, 빌드 캐시)를 삭제합니다.
  - `-a, --all`: 중지된 컨테이너와 사용하지 않는 모든 이미지를 삭제합니다.
  - `--volumes`: 볼륨도 함께 삭제합니다. (주의!)
- `docker system df`: Docker가 사용 중인 디스크 공간을 자세히 보여줍니다.
