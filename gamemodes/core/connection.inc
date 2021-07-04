new MySQL:conexion;

MysqlConnect()
{
	conexion = mysql_connect_file();
	printf("Comenzando conexion a Mysql_C: %d",mysql_errno(conexion));
	if(mysql_errno(conexion) == 0)
	{
	    print("---------------------------------------");
     	print("Conexion exitosa con la base de datos.");
     	print("---------------------------------------");
		mysql_query(conexion, "SET FOREIGN_KEY_CHECKS=1;", false);
		
		mysql_query(conexion, "UPDATE `lac_users` SET `Online`='0', `InGameID`='-1' WHERE `Online`=1;", false);
		mysql_query(conexion, "UPDATE `lac_facciones` SET `State`=0, `GameSlot`=-1 WHERE `State`=1;", false);

		mysql_set_charset("latin1");
	    mysql_tquery(conexion, "SET NAMES latin1");
	}
	else
	{
	    print("--------------------------------------");
     	print("Conexion fallida con la base de datos.");
     	print("--------------------------------------");
     	SendRconCommand("exit");
	}
}