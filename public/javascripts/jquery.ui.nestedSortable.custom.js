function recurNodes(node)
{
    node = $(node);
    var val = [node.attr('data-id')];
    var childNodes = node.children('ol').children('li');
    if(childNodes && childNodes.length > 0)
    {
        for(var i=0; i<childNodes.length; i++) val.push(recurNodes(childNodes[i]));
    }
    return val.length == 1 ? val[0] : val;
}

function serialize()
{
    var nodes = $("ol.survey_questions_container").children('li');
    var result = [];
    for(var i=0; i<nodes.length; i++) result.push(recurNodes(nodes[i]));
    return $.map(result, function(n){ return n });
}

function hRecurNodes(node, parent, result)
{
    node = $(node);
    result.push([node.attr('data-id'), parent]);
    var childNodes = node.children('ol').children('li');
    if(childNodes && childNodes.length > 0)
    {
        for(var i=0; i<childNodes.length; i++) hRecurNodes(childNodes[i], node.attr('data-id'), result);
    }
}

function hSerialize()
{
    var nodes = $("ol.sortable").children('li');
    var result = [];
    for(var i=0; i<nodes.length; i++) hRecurNodes(nodes[i], null, result);
    return result
}

function findQuestionParent(id, _questions){
    pair = null;
    _questions.every(function(_pair){
        if(_pair[0].toString() == id.toString()){
            pair = _pair.slice()
        }

        return pair == null;
    });

    return pair == null ? null : pair[1];
}