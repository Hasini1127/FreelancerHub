# FreelanceHub - Freelancer Marketplace Website

FreelanceHub is a modern, responsive, and robust Full-Stack Web Application where clients can post projects and freelancers can discover opportunities, submit proposals, and manage their profiles.

## Project Structure
- **backend/**: Contains the Express.js REST API.
    - `app.js`: Main entry point configuring Express, CORS, and routing.
    - `controllers/`: Handles business logic (`authController`, `freelancerController`, `projectController`, `proposalController`).
    - `routes/`: Maps endpoints to controller functions.
    - `middleware/`: Contains JWT authentication (`protect`) and role-based authorization (`authorize`).
    - `config/db.js`: MySQL connection pool.
- **frontend/**: Contains the HTML, CSS (Bootstrap), and client-side JavaScript.
    - `freelancers.html`: Directory of freelancers with advanced search, sorting, and filtering.
    - `freelancer-profile.html`: Detailed view of a freelancer's profile.
    - `projects.html`: Directory of available projects with filtering.
    - `project-details.html`: Detailed view of a project, enabling freelancers to submit proposals and clients to review them.
    - `client-dashboard.html`: Client management area to post projects and review postings.
    - `freelancer-dashboard.html`: Freelancer management area to track submitted and accepted proposals.
    - `js/api.js`: Handles fetch requests with JWT tokens.

## What Was Improved/Fixed
1. **Freelancer API & Directory (Fixed & Improved)**: 
    - The backend lacked a `freelancerController.js` and `freelancerRoutes.js`. These were created to join user data with their specific profiles and skills.
    - The `freelancers.html` frontend was updated to dynamically load these from the API. Added advanced filters (Max Rate, Min Rating) and sorting options (Highest Rated, Lowest Rate, Highest Rate).
2. **Freelancer Profile (Added)**: 
    - Added `freelancer-profile.html` to view the details of a specific freelancer (bio, skills, hourly rate, rating) by ID.
3. **Projects Directory (Improved)**:
    - Expanded `projects.html` sidebar to allow filtering by Search term, Budget, Experience Level, and Status, dynamically updating the project list.
4. **Project Proposals & Management (Improved)**:
    - Updated `project-details.html` so clients can view all proposals submitted to their projects and accept/reject them.
5. **Freelancer Dashboard (Fixed)**:
    - Replaced hardcoded statistics with real-time data fetched from the backend (Active Proposals, Accepted Proposals). Created a `/api/proposals/my-proposals` route.
6. **Freelancer Profile Update API (Added)**:
    - Added a `PUT /api/freelancers/profile` route so freelancers can update their bio, hourly rate, availability, etc.

## How to Run Locally

### Prerequisites
1. **Node.js**: Verify installation with `node -v`
2. **MySQL**: Verify MySQL is running locally.

### Setup Instructions
1. Open your MySQL client and run the SQL queries in `database/schema.sql` to construct the database schema.
2. Navigate to the `backend` directory in your terminal:
   ```bash
   cd backend
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Configure environment variables in `backend/.env` (DB Host, User, Password, JWT Secret).
5. Start the backend server:
   ```bash
   npm run dev
   ```
   (The server runs on `http://localhost:5000`)
6. Open the `frontend/index.html` file in your browser to view the application, or serve it using a local server (e.g., Live Server extension in VS Code).

## API Endpoints (Postman Testing)

### Auth
- **POST** `/api/auth/register` (body: name, email, password, role ['client' or 'freelancer'])
- **POST** `/api/auth/login` (body: email, password)
- **GET** `/api/auth/me` (headers: Authorization `Bearer <token>`)

### Freelancers
- **GET** `/api/freelancers` (Returns all freelancers)
- **GET** `/api/freelancers/:id` (Returns a specific freelancer profile)
- **PUT** `/api/freelancers/profile` (Auth Required: freelancer. body: professional_title, bio, hourly_rate, experience, availability, location)

### Projects
- **GET** `/api/projects` (Returns all projects)
- **GET** `/api/projects/:id` (Returns a specific project)
- **POST** `/api/projects` (Auth Required: client. body: title, description, category, budget, deadline, experience_level)
- **PUT** `/api/projects/:id` (Auth Required: client. body: title, status, etc.)
- **DELETE** `/api/projects/:id` (Auth Required: client)

### Proposals
- **POST** `/api/proposals` (Auth Required: freelancer. body: project_id, bid_amount, delivery_days, cover_letter)
- **GET** `/api/proposals/project/:projectId` (Auth Required: client)
- **GET** `/api/proposals/my-proposals` (Auth Required: freelancer)
- **PUT** `/api/proposals/:id` (Auth Required: client. body: status ['Accepted', 'Rejected'])
