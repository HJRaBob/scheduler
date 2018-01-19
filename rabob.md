# 한눈에보는 맞춤형 페이지

## 1일차

1. `grid_ster`를 적용

1. `scaffold`를 이용한 CRUD

    * 추후에 개인 메모기능으로 사용

    * 메인 페이지 작성

1. `devise`를 이용한 로그인 기능 구현

    * 로그인 후 개인 페이지가 홈이 되도록 변경

        ```ruby
            authenticated :user do
                root to: 'service#main', as: :authenticated_root
            end
        ```

## 2일차

1. `model` 구현

    * user 정보를 가지고 있는 `User`

        1. service에 필요한 정보(추가 가능)
            * 사용 서비스 개수 (기본 8개)
            ```ruby
            before_save :default_values
            def default_values
                self.service_number ||= 8
            end
            ```

            * 날씨 : 지역
            * 음악 : 서비스 사이트
            * 주가 : 종목
            * 운세 : 년도

        1. 해당 유저에관한 `service` 정보를 회원가입 후 자동으로 생성
            ```ruby
            after_create :create_service
            def create_service
                for i in 0..7
                    Service.create(
                        :user_id => self.id,
                        :sequence => (i+1)
                    )
                end
            end
            ```

    * 서비스 설정 정보 `service`(`User`와 n:1)
        1. 기본 구성
            ```ruby
            # app/models/user.rb
            class CreateServices < ActiveRecord::Migration
                def change
                    create_table :services do |t|
                    t.integer :user_id

                    #gridster
                    t.integer :sequence
                    t.integer :position_x
                    t.integer :position_y
                    t.integer :size_x
                    t.integer :size_y

                    t.timestamps null: false
                    end
                end
            end
            ```

        2. 기본 포지션 설정
        ```ruby
        class Service < ActiveRecord::Base
            belongs_to :user
            before_save :default_values

            def default_values
                self.position_x ||= ((self.sequence-1)/4)*2+1;
                self.position_y ||= (self.sequence-1)%4+1;
                if self.sequence <= 4
                    self.size_x ||= 2
                elsif
                    self.size_x ||= 1
                end
                self.size_y ||= 1;
            end
        end
        ```

    * 서비스 내용을 담는 DB
        >서비스 담당자가 직접 구현하도록 함

    * 스케쥴러
        >스케쥴러 구현시 구현

1. grid_ster 배치를 `serialize`를 이용해서 저장 할 수 있는 기능 구현

    ```js
    $.ajax({
            url: "/service/<%=current_user.id%>/allocate",
            method: "POST",
            data: {
                position: position
            }
        });
    ```
    >`position`은 이중 해쉬로 값 전달

1. service 위젯과 grid_ster 결합
    >service 화면 구성 후 `render`를 이용해 화면 출력

## 3일차

1. 설정 기능 구현

    * `select` tag

## 4일차

1. todo list 옵션에 추가

1. div 설정

1. 설정 페이지에 크기 입력받도록 추가 v