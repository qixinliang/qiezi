<?php
	function db_init($dsn,$user,$pass){
		$dbh = NULL;
		try {
    		$dbh = new PDO($dsn, $user, $pass); //初始化一个PDO对象
		} catch (PDOException $e) {
    		die ("Error!: " . $e->getMessage() . "<br/>");
		}
		return $dbh;
	}
