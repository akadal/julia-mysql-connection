using MySQL
using DataFrames
using CSV
global conn

host = ""
user = ""
password = ""
db = ""

conn = DBInterface.connect(MySQL.Connection, host, user, password, db=db)

call = function(sql, saveFile = "")
    stmt = DBInterface.prepare(conn, sql)
    res = DBInterface.execute(stmt)
    DBInterface.close!(stmt)
    
    if (saveFile != "")
        
      CSV.write(saveFile, res)
      println("Results have been stored in ", saveFile)
   
    end
    
    return(DataFrame(res))
end

closeConnection = function()
    DBInterface.close!(conn)
end
