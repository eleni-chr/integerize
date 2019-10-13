function out = integerize(A)

% The function takes as its input a matrix A of integers of type double,
% and returns the name of the “smallest” signed integer class to which A
% can be converted without loss of information. If no such class exists,
% the text 'NONE' is returned. For example, if the smallest element of A is
% -100 and the largest is +100, then the function would return 'int8'. As
% another example, if there is an element of A equal to -1e20, then the
% function would return 'NONE'.

[S,L]=bounds(A,'all');
if S<intmin('int64') || L>intmax('int64')
    out=sprintf('NONE');
elseif L>=intmin('int8') && L<=intmax('int8') && S>=intmin('int8') && S<=intmax('int8')
    out=sprintf('int8');
elseif L>=intmin('int16') && L<=intmax('int16') && (L<intmin('int8') || L>intmax('int8') || S<intmin('int8') || S>intmax('int8')) ...
        && S>=intmin('int16') && S<=intmax('int16')
    out=sprintf('int16');
elseif L>=intmin('int32') && L<=intmax('int32') && (L>intmin('int16') || L>intmax('int16') || S<intmin('int16') || S>intmax('int16')) ...
        && S>=intmin('int32') && S<=intmax('int32')
    out=sprintf('int32');    
elseif L>=intmin('int64') && L<=intmax('int64') && (L>intmin('int32') || L>intmax('int32') || S<intmin('int32') || S>intmax('int32')) ...
        && S>=intmin('int64') && S<=intmax('int64')
    out=sprintf('int64');
end
end