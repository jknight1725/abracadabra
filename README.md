# abracadabra
1. Rules. Beginning at the top A you may move down to adjacent letters by
either moving left (slope -1) or right (slope +1). You must end on the bottom
A. You may not use any letter more than once and you may not travel up.

Question. In how many ways can you spell ABRACADABRA?

                                         A
                                       B   B
                                     R   R   R
                                   A   A   A   A
                                 C   C   C   C   C
                               A   A   A   A   A   A
                                 D   D   D   D   D
                                   A   A   A   A  
                                     B   B   B
                                       R   R
                                         A


abracadabra.rb prints out all 252 possible solutions to the problem. 
There are 10 moves to make to reach the bottom of the puzzle
5 of which must be lefts, 5 of which must be rights
10! / 5! 5! = 252

The program also contains methods to input your own sequence, validate that the sequence is a solution, and print that solution.
