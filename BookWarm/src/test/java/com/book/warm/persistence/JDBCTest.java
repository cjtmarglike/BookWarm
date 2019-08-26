package com.book.warm.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

// �׽�Ʈ ���н� (GB)
// 1. �����н��� ojdbc8 �߰��ϱ�.
// 2. ������ ���̵� , �н����� Ȯ���ϰ� , sqldeveloper��  ���̵� ������� Ȯ�����ּ���.
// 3. �� �� �ȵǴ°��� caption warm or staff Caption warm ���� �����ּ���.

@Log4j
public class JDBCTest {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "book",
				"warm")) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
