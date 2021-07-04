RegisterBankPlayerTransaction(player_id, by_user, amount, transaction_type)
{
	new DB_Query[215];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `lac_transactions_bank`\
		(\
			`id_user`, `by_user`, `amount`, `transaction_type`, `date`\
		)\
		VALUES\
		(\
			%d, %d, %d, %d, current_timestamp\
		);\
	", player_id, by_user,  amount, transaction_type);
	mysql_tquery(conexion, DB_Query);
	return 1;
}