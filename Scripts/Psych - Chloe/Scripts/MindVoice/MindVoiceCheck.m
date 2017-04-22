function correct = MindVoiceCheck(num, response)

order = ['s' 'k' 'x' 'm'];
answers = [3,3,2,2,1,2,2,1,2,2,1,2,1,2,1,4,1,4,4,2,1,3,2,4,3]

x = order(answers(num));
if response == x
    correct = 1;
else
    correct = 0;
end