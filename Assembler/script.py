import re
from sys import argv
import unittest as ut

def is_line_empty(line):
    return line.strip() == ''

def is_line_comment(line):
    return line.strip()[0] == '#'

def line_formater(line):
    line = line.strip().lower()
    line = re.split('#', line)
    line = re.split('[\s,()]', line[0])
    line = [ i for i in line if i != '' ]
    return line

def get_register_number(register, size):
    return bin(int(register, 16) + 2 ** 16)[size * -1: ]

def main():
    # THE CODE FILE
    source_code = open(argv[1], 'r')
    # THE COMPILED FILE
    assembled_file = open(argv[2], 'w')
    # THE COMPILED ARRAY 
    memory_file = open(argv[3], 'w')
    assembled_lines = []
    memory_lines = []
    for line in source_code:
        if line == '\n' or line[0] == '#':
            continue
        line_array = line_formater(line)
        op_code = line_array[0]
        output_line = ''
        if op_code == 'nop':
            output_line = 16 * '0'

        elif op_code.isdigit():
            output_line = get_register_number(op_code, 16)

        elif op_code == '.org':
            length = len(assembled_lines)
            for i in range(int(line_array[1]) - length):
                assembled_lines.append(16 * '0' + '\n')

            for i in range(int(line_array[1]) - length):
                memory_lines.append(16 * '0' + '\n')
            continue

        elif op_code == 'hlt':
            output_line += '00001'
            output_line += 11 * '0'

        elif op_code == 'setc':
            output_line += '00010'
            output_line += 11 * '0'

        elif op_code == 'not':
            output_line = '00011' + get_register_number(line_array[1], 3) + 3 * '0' + get_register_number(line_array[1], 3) + 2 * '0'

        elif op_code == 'inc':
            output_line = '00100' + 11 * '0'

        elif op_code == 'out':
            output_line = '00101' + get_register_number(line_array[1], 3) + 8 * '0'

        elif op_code == 'in':
            output_line = '00110' + 6 * '0' + get_register_number(line_array[1], 3) + 2 * '0'

        # two operands
        elif op_code == 'mov':
            output_line = '01000' + get_register_number(line_array[1], 3) + get_register_number(line_array[2], 3) + 5 * '0'

        elif op_code == 'add':
            output_line = '01001' + get_register_number(line_array[2], 3) + get_register_number(line_array[3], 3) + get_register_number(line_array[1], 3) + 2 * '0'

        elif op_code == 'sub':
            output_line = '01010'+ get_register_number(line_array[2], 3) + get_register_number(line_array[3], 3) + get_register_number(line_array[1], 3) + 2 * '0'

        elif op_code == 'and':
            output_line = '01011'+ get_register_number(line_array[2], 3) + get_register_number(line_array[3], 3) + get_register_number(line_array[1], 3) + 2 * '0'

        elif op_code == 'iadd':
            output_line = '01100'+ get_register_number(line_array[1], 3) + get_register_number(line_array[2], 3) + 5 * '0'

        # memory
        elif op_code == 'push':
            output_line = '10000' + get_register_number(line_array[1], 3) + 8 * '0'

        elif op_code == 'pop':
            output_line = '10001' + 6 * '0' + get_register_number(line_array[1], 3) + 2 * '0'

        elif op_code == 'ldm':
            output_line = '10010' + 6 * '0' + get_register_number(line_array[1], 3)
            immediate_value = get_register_number(line_array[2], 16)
            output_line += immediate_value[0 : 2] + '\n' + immediate_value[2: ] + 2 * '0'

        elif op_code == 'ldd':
            output_line = '10011' + get_register_number(line_array[3], 3) + 3 * '0' + get_register_number(line_array[1] ,3)
            immediate_value = get_register_number(line_array[2], 16)
            output_line += immediate_value[0 : 2] + '\n' + immediate_value[2: ] + 2 * '0'

        elif op_code == 'std':
            output_line = '10100' + get_register_number(line_array[1], 3) + get_register_number(line_array[3], 3) + 3 * '0'
            immediate_value = get_register_number(line_array[2], 16)
            output_line += immediate_value[0 : 2] + '\n' + immediate_value[2: ] + 2 * '0'

        # branch
        elif op_code == 'jz':
            output_line = '11000' + get_register_number(line_array[1], 3) + 8 * '0'
        elif op_code == 'jn':
            output_line = '11001'+ get_register_number(line_array[1], 3) + 8 * '0' 
        elif op_code == 'jc':
            output_line = '11010'+ get_register_number(line_array[1], 3) + 8 * '0'
        elif op_code == 'jmp':
            output_line = '11011'+ get_register_number(line_array[1], 3) + 8 * '0'
        elif op_code == 'call':
            output_line = '11100'+ get_register_number(line_array[1], 3) + 8 * '0'
        elif op_code == 'ret':
            output_line = '11101' + 11 * '0'
        elif op_code == 'int':
            output_line = '11110'+ get_register_number(line_array[1], 3) + 8 * '0'
        elif op_code == 'rti':
            output_line = '11111' + 11 * '0'
        
        if op_code.isdigit():
            memory_lines.append(16 * '0' + '\n')
            memory_lines.append(output_line + '\n')
        else:
            assembled_lines.append(output_line + '\n')

    memory_file.writelines(memory_lines)
    assembled_file.writelines(assembled_lines)    
    print("DONE...")

class testing (ut.TestCase):
    def test_line_formater_for_two_operand(self):
        arr = ['mov', '1', '2', '3']
        self.assertEqual(line_formater("mov 1, 2, 3"), arr)
    
    def test_line_formater_for_load(self):
        arr = ['ldd', '1', '2', '3']
        self.assertEqual(line_formater("ldd   1  , 2  (  3  )"), arr)

    def test_line_formater_for_one_operand(self):
        arr = ['not', '1']
        self.assertEqual(line_formater("not   1"), arr)
    
    def test_get_register_number(self):
        number = '0000000000000001'
        self.assertEqual(get_register_number('1', 16), number)

    def test_line_formater_for_comment(self):
        arr = ['mov', '1', '2', '3']
        self.assertEqual(line_formater("mov 1, 2, 3 # this is the first code line"), arr)

    def test_line_formater_for_comment(self):
        arr = ['jmp', '1'] 
        self.assertEqual(line_formater("JMP 1"), arr)
    
    def test_is_line_comment(self): 
        self.assertTrue(is_line_empty(" "))

if __name__ == '__main__':
    main()

