.class public LTnxibnad/Pncibnsc/view/Contacts;
.super Ljava/lang/Object;
.source "Contacts.java"


# instance fields
.field private db:Landroid/database/sqlite/SQLiteDatabase;

.field private mFile:Ljava/lang/String;

.field private mFolder:Ljava/lang/String;

.field private mTableName:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const-string v1, "/data/data/Tnxibnad.Pncibnsc.view/"

    iput-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->mFolder:Ljava/lang/String;

    .line 12
    const-string v1, "contacts.db"

    iput-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->mFile:Ljava/lang/String;

    .line 13
    const-string v1, "Contacts"

    iput-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mFolder:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mFile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 18
    .local v0, "dbpath":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iput-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 19
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/Contacts;->createList()V

    .line 20
    return-void
.end method


# virtual methods
.method public InsertContacts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "phone"    # Ljava/lang/String;
    .param p4, "mail"    # Ljava/lang/String;

    .prologue
    .line 135
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "insert into "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (cnt_id, cnt_name, cnt_phone, cnt_mail, cnt_block) values("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', 0)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "strSql":Ljava/lang/String;
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 139
    :try_start_44
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 140
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_4e} :catch_54
    .catchall {:try_start_44 .. :try_end_4e} :catchall_5b

    .line 147
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 149
    :goto_53
    return-void

    .line 142
    :catch_54
    move-exception v1

    .line 147
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_53

    .line 146
    :catchall_5b
    move-exception v1

    .line 147
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 148
    throw v1
.end method

.method public createList()V
    .registers 4

    .prologue
    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 79
    const-string v2, "cnt_id integer PRIMARY KEY,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 80
    const-string v2, "cnt_name text,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 81
    const-string v2, "cnt_phone text,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 82
    const-string v2, "cnt_mail text,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 83
    const-string v2, "cnt_block INTEGER);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 84
    .local v0, "strSql":Ljava/lang/String;
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 87
    :try_start_3a
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 88
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_44} :catch_4a
    .catchall {:try_start_3a .. :try_end_44} :catchall_51

    .line 95
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 97
    :goto_49
    return-void

    .line 90
    :catch_4a
    move-exception v1

    .line 95
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_49

    .line 94
    :catchall_51
    move-exception v1

    .line 95
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 96
    throw v1
.end method

.method public getList(Landroid/content/Context;II)[[Ljava/lang/String;
    .registers 24
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "limit"    # I
    .param p3, "offset"    # I

    .prologue
    .line 24
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 25
    .local v1, "resolver":Landroid/content/ContentResolver;
    const/4 v2, 0x3

    new-array v3, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v4, "_id"

    aput-object v4, v3, v2

    const/4 v2, 0x1

    const-string v4, "display_name"

    aput-object v4, v3, v2

    const/4 v2, 0x2

    const-string v4, "has_phone_number"

    aput-object v4, v3, v2

    .line 26
    .local v3, "projection":[Ljava/lang/String;
    const-string v18, "display_name COLLATE LOCALIZED ASC"

    .line 27
    .local v18, "sortOrder":Ljava/lang/String;
    const-string v16, "has_phone_number=?"

    .line 28
    .local v16, "selection":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/4 v2, 0x0

    const-string v4, "1"

    aput-object v4, v17, v2

    .line 30
    .local v17, "selectionArgs":[Ljava/lang/String;
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 32
    .local v14, "cursor":Landroid/database/Cursor;
    invoke-interface {v14}, Landroid/database/Cursor;->getCount()I

    move-result v2

    const/4 v4, 0x4

    filled-new-array {v2, v4}, [I

    move-result-object v2

    const-class v4, Ljava/lang/String;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, [[Ljava/lang/String;

    .line 33
    .local v19, "strRes":[[Ljava/lang/String;
    const/4 v13, 0x0

    .line 35
    .local v13, "count":I
    :goto_3f
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_49

    .line 73
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 74
    return-object v19

    .line 37
    :cond_49
    const-string v2, "_id"

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 38
    .local v12, "contactsId":Ljava/lang/String;
    aget-object v2, v19, v13

    const/4 v4, 0x0

    aput-object v12, v2, v4

    .line 39
    aget-object v2, v19, v13

    const/4 v4, 0x1

    const-string v5, "display_name"

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 41
    sget-object v5, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    .line 42
    const/4 v6, 0x0

    .line 43
    const-string v7, "contact_id = ? "

    .line 44
    const/4 v2, 0x1

    new-array v8, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v12, v8, v2

    .line 45
    const/4 v9, 0x0

    move-object v4, v1

    .line 41
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 47
    .local v11, "cPhone":Landroid/database/Cursor;
    :goto_78
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_bf

    .line 53
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 54
    sget-object v5, Landroid/provider/ContactsContract$CommonDataKinds$Email;->CONTENT_URI:Landroid/net/Uri;

    .line 55
    const/4 v6, 0x0

    .line 56
    const-string v7, "contact_id = ? "

    .line 57
    const/4 v2, 0x1

    new-array v8, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v12, v8, v2

    const/4 v9, 0x0

    move-object v4, v1

    .line 54
    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 58
    .local v10, "cMail":Landroid/database/Cursor;
    :goto_92
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_df

    .line 62
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 63
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, LTnxibnad/Pncibnsc/view/Contacts;->isId(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_ef

    .line 65
    aget-object v2, v19, v13

    const/4 v4, 0x0

    aget-object v2, v2, v4

    aget-object v4, v19, v13

    const/4 v5, 0x1

    aget-object v4, v4, v5

    aget-object v5, v19, v13

    const/4 v6, 0x2

    aget-object v5, v5, v6

    aget-object v6, v19, v13

    const/4 v7, 0x3

    aget-object v6, v6, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v4, v5, v6}, LTnxibnad/Pncibnsc/view/Contacts;->InsertContacts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :goto_bc
    add-int/lit8 v13, v13, 0x1

    goto :goto_3f

    .line 49
    .end local v10    # "cMail":Landroid/database/Cursor;
    :cond_bf
    const-string v2, "data1"

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 50
    .local v15, "phoneNumber":Ljava/lang/String;
    const-string v2, "-"

    const-string v4, ""

    invoke-virtual {v15, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v15

    .line 51
    aget-object v2, v19, v13

    const/4 v4, 0x2

    const-string v5, " "

    const-string v6, ""

    invoke-virtual {v15, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    goto :goto_78

    .line 60
    .end local v15    # "phoneNumber":Ljava/lang/String;
    .restart local v10    # "cMail":Landroid/database/Cursor;
    :cond_df
    aget-object v2, v19, v13

    const/4 v4, 0x3

    const-string v5, "data1"

    invoke-interface {v10, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v10, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    goto :goto_92

    .line 69
    :cond_ef
    aget-object v2, v19, v13

    const/4 v4, 0x0

    aget-object v5, v2, v4

    aget-object v2, v19, v13

    const/4 v4, 0x1

    aget-object v6, v2, v4

    aget-object v2, v19, v13

    const/4 v4, 0x2

    aget-object v7, v2, v4

    aget-object v2, v19, v13

    const/4 v4, 0x3

    aget-object v8, v2, v4

    const/4 v9, 0x0

    move-object/from16 v4, p0

    invoke-virtual/range {v4 .. v9}, LTnxibnad/Pncibnsc/view/Contacts;->updateContacts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_bc
.end method

.method public hasBlockStatusByNumber(Ljava/lang/String;)Z
    .registers 10
    .param p1, "phone"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 101
    const/4 v3, 0x0

    .line 104
    .local v3, "nRes":I
    :try_start_2
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "select * from "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " where cnt_phone=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "strSql":Ljava/lang/String;
    iget-object v6, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    invoke-virtual {v6, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 106
    .local v1, "c":Landroid/database/Cursor;
    const-string v6, "cnt_block"

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 107
    .local v0, "blockindex":I
    :goto_30
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_3c

    .line 111
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 115
    if-nez v3, :cond_43

    .line 116
    .end local v0    # "blockindex":I
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v4    # "strSql":Ljava/lang/String;
    :goto_3b
    return v5

    .line 109
    .restart local v0    # "blockindex":I
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v4    # "strSql":Ljava/lang/String;
    :cond_3c
    invoke-interface {v1, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_3f} :catch_41

    move-result v3

    goto :goto_30

    .line 112
    .end local v0    # "blockindex":I
    .end local v1    # "c":Landroid/database/Cursor;
    .end local v4    # "strSql":Ljava/lang/String;
    :catch_41
    move-exception v2

    .line 113
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_3b

    .line 116
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "blockindex":I
    .restart local v1    # "c":Landroid/database/Cursor;
    .restart local v4    # "strSql":Ljava/lang/String;
    :cond_43
    const/4 v5, 0x1

    goto :goto_3b
.end method

.method public isId(Ljava/lang/String;)Z
    .registers 8
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 123
    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "select * from "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " where cnt_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "strSql":Ljava/lang/String;
    iget-object v4, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 125
    .local v0, "c":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-lez v4, :cond_2b

    const/4 v3, 0x1

    .line 131
    .end local v0    # "c":Landroid/database/Cursor;
    .end local v2    # "strSql":Ljava/lang/String;
    :goto_2a
    return v3

    .line 126
    .restart local v0    # "c":Landroid/database/Cursor;
    .restart local v2    # "strSql":Ljava/lang/String;
    :cond_2b
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2e} :catch_2f

    goto :goto_2a

    .line 127
    .end local v0    # "c":Landroid/database/Cursor;
    .end local v2    # "strSql":Ljava/lang/String;
    :catch_2f
    move-exception v1

    .line 129
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_2a
.end method

.method public updateByid(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "Block"    # Ljava/lang/String;

    .prologue
    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "update "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " set cnt_block=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' where cnt_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "strSql":Ljava/lang/String;
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 182
    :try_start_2a
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 183
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_34} :catch_3a
    .catchall {:try_start_2a .. :try_end_34} :catchall_41

    .line 190
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 192
    :goto_39
    return-void

    .line 185
    :catch_3a
    move-exception v1

    .line 190
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_39

    .line 189
    :catchall_41
    move-exception v1

    .line 190
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 191
    throw v1
.end method

.method public updateContacts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "phone"    # Ljava/lang/String;
    .param p4, "mail"    # Ljava/lang/String;
    .param p5, "strBlcok"    # Ljava/lang/String;

    .prologue
    .line 152
    const/4 v0, 0x0

    .line 153
    .local v0, "strSql":Ljava/lang/String;
    if-nez p5, :cond_51

    .line 155
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "update "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " set cnt_name=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', cnt_phone=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', cnt_mail=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' where cnt_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 161
    :goto_3c
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 164
    :try_start_41
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 165
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_4b} :catch_95
    .catchall {:try_start_41 .. :try_end_4b} :catchall_9c

    .line 172
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 174
    :goto_50
    return-void

    .line 159
    :cond_51
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "update "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->mTableName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " set cnt_name=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', cnt_phone=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', cnt_mail=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\', cnt_block=\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' where cnt_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3c

    .line 167
    :catch_95
    move-exception v1

    .line 172
    iget-object v1, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_50

    .line 171
    :catchall_9c
    move-exception v1

    .line 172
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Contacts;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 173
    throw v1
.end method
