s/^\(Type error\) \[\(.*\),\([0-9]\+\),.*]:\(.*\)$/error:\2:\3:\1 \4/
s/^\(Parse error\) \[\(.*\),\([0-9]\+\);.*]:\(.*\)$/error:\2:\3:\1 \4/
s/^\(Overloading error\) \[\(.*\),\([0-9]\+\),.*]:\(.*\)$/error:\2:\3:\1 \4/
# Error [test.icl,17,]: foobar undefined
s/^\(Error\) \[\(.*\),\([0-9]\+\),\(.*\)]:\(.*\)$/error:\2:\3:\1 \4:\5/
# Error [mTasksSpec.dcl,1]: incorrect module header
s/^\(Error\) \[\(.*\),\([0-9]\+\)]:\(.*\)$/error:\2:\3:\1 \4/
