exports.fieldsToInstert= (data)=>{
    let fields=[];
    let values=[];
    for(field in data){
        fields.push("`"+field+"`");
        let value= data[field]+"";
        value= value.replace(/\"/g,'\\\"')
                    .replace(/\'/g,'\\\'').trim();
        if(value=="null"){
            values.push("null");
        }else{
            values.push("'"+value+"'");
        }
        
    }
    return "("+fields.join(", ")+") values ("+values.join(", ")+")";
}

exports.fieldsToUpdate= (data)=>{
    let fields=[];
    for(field in data){
        let value= data[field]+"";
        value= value.replace(/\"/g,'\\\"')
                    .replace(/\'/g,'\\\'').trim();
        if(value=="null"){
            fields.push("`"+field+"`"+"=null");
        }else{
            fields.push("`"+field+"`"+"='"+value+"'");
        }
    }
    return fields.join(", ");
}