import java.sql.*;
import java.util.Scanner;

public class ApplicationLayer {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            System.out.println("Connected to MySQL successfully.");

            System.out.println("\n====================");
            System.out.println("CRUD DEMO ON person");
            System.out.println("====================");

            
            scanner.nextLine();
            int newPersonId = createPerson(conn, "Tyler", "Millershaski", "989-555-9999", "Student", "2026-04-23");

            scanner.nextLine();
            readPeople(conn);
            
            scanner.nextLine();
            updatePerson(conn, newPersonId, "Tyler", "Millershaski", "989-555-1111", "Researcher", "2026-04-23");
            
            scanner.nextLine();
            readPersonById(conn, newPersonId);
            
            scanner.nextLine();
            deletePerson(conn, newPersonId);

            System.out.println("\n====================");
            System.out.println("5 EXAMPLE QUERIES");
            System.out.println("====================");
            runFiveQueries(conn);

            System.out.println("\n====================");
            System.out.println("CUSTOM QUERY MODE");
            System.out.println("====================");
            customQueryLoop(conn, scanner);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            scanner.close();
        }
    }

    // -------------------------
    // CRUD ON person TABLE
    // person(id, first_name, last_name, phone, affiliation_type, start_date)
    // -------------------------

    private static int createPerson(Connection conn, String firstName, String lastName,
                                    String phone, String affiliationType, String startDate) throws SQLException {

        String sql = """
            INSERT INTO person (first_name, last_name, phone, affiliation_type, start_date)
            VALUES (?, ?, ?, ?, ?)
        """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, phone);
            pstmt.setString(4, affiliationType);
            pstmt.setDate(5, Date.valueOf(startDate));

            int rows = pstmt.executeUpdate();
            System.out.println("CREATE: " + rows + " row(s) inserted.");

            try (ResultSet keys = pstmt.getGeneratedKeys()) {
                if (keys.next()) {
                    int id = keys.getInt(1);
                    System.out.println("New person id = " + id);
                    return id;
                }
            }
        }

        throw new SQLException("Insert succeeded but no generated key was returned.");
    }

    private static void readPeople(Connection conn) throws SQLException {
        String sql = """
            SELECT id, first_name, last_name, phone, affiliation_type, start_date
            FROM person
            ORDER BY id
        """;

        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("\nREAD ALL PEOPLE:");
            printResultSet(rs);
        }
    }

    private static void readPersonById(Connection conn, int id) throws SQLException {
        String sql = """
            SELECT id, first_name, last_name, phone, affiliation_type, start_date
            FROM person
            WHERE id = ?
        """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println("\nREAD PERSON BY ID:");
                printResultSet(rs);
            }
        }
    }

    private static void updatePerson(Connection conn, int id, String firstName, String lastName,
                                     String phone, String affiliationType, String startDate) throws SQLException {

        String sql = """
            UPDATE person
            SET first_name = ?, last_name = ?, phone = ?, affiliation_type = ?, start_date = ?
            WHERE id = ?
        """;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, phone);
            pstmt.setString(4, affiliationType);
            pstmt.setDate(5, Date.valueOf(startDate));
            pstmt.setInt(6, id);

            int rows = pstmt.executeUpdate();
            System.out.println("UPDATE: " + rows + " row(s) updated.");
        }
    }

    private static void deletePerson(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM person WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            int rows = pstmt.executeUpdate();
            System.out.println("DELETE: " + rows + " row(s) deleted.");
        }
    }

    // -------------------------
    // 5 QUERIES FOR YOUR SCHEMA
    // -------------------------

    private static void runFiveQueries(Connection conn) throws SQLException {
        String[] queries = {
            // 1
            """
            SELECT p.first_name, p.last_name, r.name AS role_name
            FROM person p
            JOIN person_role pr ON p.id = pr.person_id
            JOIN role r ON pr.role_id = r.id
            ORDER BY p.id
            """,

            // 2
            """
            SELECT rp.title
            FROM research_project rp
            JOIN project_assignee pa ON rp.id = pa.project_id
            JOIN person p ON pa.person_id = p.id
            WHERE p.first_name = 'Sophia' AND p.last_name = 'Ward'
            """,

            // 3
            """
            SELECT ct.name, os.start_date, os.end_date
            FROM celestial_target ct
            JOIN observation_session os ON ct.id = os.target_id
            WHERE os.start_date >= '2025-01-01'
            ORDER BY os.start_date
            """,

            // 4
            """
            SELECT pe.title, COUNT(ep.person_id) AS participant_count
            FROM public_event pe
            LEFT JOIN event_participant ep ON pe.id = ep.event_id
            GROUP BY pe.id, pe.title
            ORDER BY participant_count DESC
            """,

            // 5
            """
            SELECT e.name AS equipment_name, p.first_name, p.last_name, eb.start_date, eb.end_date
            FROM equipment_booking eb
            JOIN equipment e ON eb.equipment_id = e.id
            JOIN person p ON eb.person_id = p.id
            ORDER BY eb.start_date
            """
        };

        for (int i = 0; i < queries.length; i++) {
            System.out.println("\n--- Query " + (i + 1) + " ---");
            System.out.println(queries[i]);

            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(queries[i])) {
                printResultSet(rs);
            }
        }
    }

    // -------------------------
    // USER-ENTERED SQL LOOP
    // -------------------------

    private static void customQueryLoop(Connection conn, Scanner scanner) {
        System.out.println("Enter SQL queries below.");
        System.out.println("Type exit to quit.");

        while (true) {
            System.out.print("\nSQL> ");
            String sql = scanner.nextLine().trim();

            if (sql.equalsIgnoreCase("exit")) {
                System.out.println("Goodbye.");
                break;
            }

            if (sql.isEmpty()) {
                System.out.println("Please enter a query.");
                continue;
            }

            try (Statement stmt = conn.createStatement()) {
                boolean hasResultSet = stmt.execute(sql);

                if (hasResultSet) {
                    try (ResultSet rs = stmt.getResultSet()) {
                        printResultSet(rs);
                    }
                } else {
                    int affectedRows = stmt.getUpdateCount();
                    System.out.println("Query executed successfully. Rows affected: " + affectedRows);
                }

            } catch (SQLException e) {
                System.out.println("SQL Error: " + e.getMessage());
            }
        }
    }

    // -------------------------
    // GENERIC RESULTSET PRINTER
    // -------------------------

    private static void printResultSet(ResultSet rs) throws SQLException {
        ResultSetMetaData meta = rs.getMetaData();
        int columnCount = meta.getColumnCount();

        for (int i = 1; i <= columnCount; i++) {
            System.out.print(meta.getColumnLabel(i) + "\t");
        }
        System.out.println();

        boolean hasRows = false;
        while (rs.next()) {
            hasRows = true;
            for (int i = 1; i <= columnCount; i++) {
                Object value = rs.getObject(i);
                System.out.print(value + "\t");
            }
            System.out.println();
        }

        if (!hasRows) {
            System.out.println("(no rows)");
        }
    }
}