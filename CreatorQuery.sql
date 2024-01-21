DECLARE @TableName varchar(20) = 'Employee';
DECLARE @Result varchar(max) = 'public class ' + @TableName + '{';
DECLARE @NewLineChar AS CHAR(2) = CHAR(13) + CHAR(10)


SELECT @Result = @Result + @NewLineChar + 'public ' + 
     CASE sst.name 
            when 'datetime' then 'DateTime'
            when 'datetime2' then 'DateTime'
            when 'datetimeoffset' then 'DateTimeOffset'
            when 'decimal' then 'decimal'
            when 'float' then 'double'
            when 'image' then 'byte[]'
            when 'int' then 'int'
            when 'money' then 'decimal'
            when 'nchar' then 'string'
            when 'ntext' then 'string'
            when 'numeric' then 'decimal'
            when 'nvarchar' then 'string'
            when 'real' then 'float'
            when 'smalldatetime' then 'DateTime'
            when 'smallint' then 'short'
            when 'smallmoney' then 'decimal'
            when 'text' then 'string'
            when 'time' then 'TimeSpan'
            when 'timestamp' then 'long'
            when 'tinyint' then 'byte'
            when 'uniqueidentifier' then 'Guid'
            when 'varbinary' then 'byte[]'
            when 'varchar' then 'string'
			ELSE sc.name
			END + ' ' + sc.name + ' {get ; set ;} ' 
			+ @NewLineChar
FROM 
sys.columns sc
inner join
sys.systypes sst
ON sc.system_type_id = sst.xtype
WHERE object_id =  901578250 and NOT sst.name = 'sysname' 
set @Result = @Result  + '
}'

PRINT(@Result)

