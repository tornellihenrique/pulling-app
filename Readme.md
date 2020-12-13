## Building a Full Stack Polls app similar to twitter polls with Spring Boot, Spring Security, JWT, React and Ant Design

![App Screenshot](screenshot.png)

## Steps to Setup the full project with Docker

1. **Install Docker Engine**
	
	Download and install Docker throught the [Official Installation Guide](https://docs.docker.com/engine/install/).

2. **Clone the application**

	```bash
	git clone https://github.com/tornellihenrique/pulling-app.git
	cd pulling-app
	```

4. **Change the local IP Host**

	This is necessary for the docker to work properly and recognize other containers.
	
	To get your IP, simply use the following command:
	```bash
	ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
	```

	+ open `polling-app-server/src/main/resources/application.properties` file.
	+ change `spring.datasource.url` replacing the `{HOST}` with your local IP.
	
	+ open `polling-app-client/src/constants/index.js` file.
	+ change `API_BASE_URL` const replacing the `{HOST}` with your local IP.

5. **Build the React Front end app (polling-app-client)**

	```bash
	cd polling-app-client
	npm install
	npm run build
	cd ..
	```

6. **Build the Spring Boot Back end app (polling-app-server)**

	```bash
	cd polling-app-server
	mvn clean package
	cd ..
	```

7. **Run docker-compose**

	This will also create a MySQL database container for the project.

	```bash
	cd polling-app-deploy
	sudo bash run-compose-up.sh
	```

## Steps to Setup the Spring Boot Back end app (polling-app-server)

1. **Clone the application**

	```bash
	git clone https://github.com/tornellihenrique/pulling-app.git
	cd pulling-app/polling-app-server
	```

2. **Create MySQL database**

	```bash
	create database polling_app
	```

3. **Change MySQL username and password as per your MySQL installation**

	+ open `src/main/resources/application.properties` file.

	+ change `spring.datasource.username` and `spring.datasource.password` properties as per your mysql installation

4. **Run the app**

	You can run the spring boot app by typing the following command -

	```bash
	mvn spring-boot:run
	```

	The server will start on port 8080.

	You can also package the application in the form of a `jar` file and then run it like so -

	```bash
	mvn package
	java -jar target/polls-0.0.1-SNAPSHOT.jar
	```
5. **Default Roles**
	
	The spring boot app uses role based authorization powered by spring security. To add the default roles in the database, I have added the following sql queries in `src/main/resources/data.sql` file. Spring boot will automatically execute this script on startup -

	```sql
	INSERT IGNORE INTO roles(name) VALUES('ROLE_USER');
	INSERT IGNORE INTO roles(name) VALUES('ROLE_ADMIN');
	```

	Any new user who signs up to the app is assigned the `ROLE_USER` by default.

## Steps to Setup the React Front end app (polling-app-client)

First go to the `polling-app-client` folder -

```bash
cd polling-app-client
```

Then type the following command to install the dependencies and start the application -

```bash
npm install && npm start
```

The front-end server will start on port `3000`.

### Tutorials

Rajeev written a complete tutorial series for this application on The CalliCoder Blog -

+ [Part 1: Bootstrapping the Project and creating the basic domain models and repositories](https://www.callicoder.com/spring-boot-spring-security-jwt-mysql-react-app-part-1/)

+ [Part 2: Configuring Spring Security along with JWT authentication and Building Rest APIs for Login and SignUp](https://www.callicoder.com/spring-boot-spring-security-jwt-mysql-react-app-part-2/)

+ [Part 3: Building Rest APIs for creating Polls, voting for a choice in a Poll, retrieving user profile etc](https://www.callicoder.com/spring-boot-spring-security-jwt-mysql-react-app-part-3/)

+ [Part 4: Building the front-end using React and Ant Design](https://www.callicoder.com/spring-boot-spring-security-jwt-mysql-react-app-part-4/)
