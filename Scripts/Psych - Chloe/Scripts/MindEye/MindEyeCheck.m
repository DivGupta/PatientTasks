function correct = MindEyeCheck(num, response)

orderd = ['s' 'k' 'x' 'm'];
answers = [1,2,3,2,3,2,3,1,4,1,3,3,2,4,1,2,1,1,4,2,2,1,3,1,4,3,2,1,4,2,2,1,4,3,2,3];


temp = answers(num);
x = orderd(temp);

if response == x
    correct = 1;
else
    correct = 0;
end