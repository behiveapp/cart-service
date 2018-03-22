# DOCKER_TEST = "./docker-compose-test.yml"
install:
	docker-compose build
start: 
	docker-compose up
start-debug: 
	docker-compose up -d
	docker attach cart-service
test:
	docker-compose run app bundle exec rspec
rubocop:
	docker-compose run app rubocop
# test-unit:
# 	docker-compose -f $(DOCKER_TEST) run app npm run test-unit
# test-system:
# 	docker-compose -f $(DOCKER_TEST) run app npm run test-system