# Restaurant Deals App (Rails 8)

This application lists restaurants and their associated daily deals.

### Prerequisites

- Ruby 3.3.1+
- Node.js and npm
- PostgreSQL

### Setup Instructions

1.  **Clone & Bundle:**

    ```bash
    # git clone <your-repo-url>
    # cd <your-repo-name>
    bundle install
    ```

2.  **Install JavaScript Dependencies:**

    ```bash
    npm install
    ```

3.  **Setup Environment Variables:**
    Create a `.env` file in your root directory for database credentials.

    ```
    DATABASE_URL="postgresql://<user>:<password>@localhost/happy_hour_development"
    ```

4.  **Create and Migrate the Database:**
    Make sure your PostgreSQL server is running.

    ```bash
    rails db:create
    rails db:migrate
    ```

5.  **Run the Server:**
    This will start both the Rails server and the Tailwind CSS watcher.

    ```bash
    bin/dev
    ```

6.  **Open the App:**
    Navigate to [http://localhost:3000](http://localhost:3000) in your browser.
