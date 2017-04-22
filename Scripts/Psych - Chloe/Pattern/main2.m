function new = main2(ind)

file = 'digits2.pgm';
output = bounding(file);

new = [];
for i = 1:6:60
    int = 0;
    for x = i:i+5
        val = output{x};
        int = int + val(ind);
    end
    new = [new, int/6];
end