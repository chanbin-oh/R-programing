# -*- coding: utf-8 -*-


def get_factorial_value(integer_value):
    mult =  1
    for i  in range(1, integer_value + 1):
        mult = mult * i

    return mult

def is_positive_number(integer_str_value):
    # '''
    # Input:
    #   - integer_str_value : 숫자형태의 문자열 값
    # Output:
    #   - integer_str_value가 양수일 경우에는 True,
    #     integer로 변환이 안되거나, 0, 음수일 경우에는 flase
    # Examples:
    #   >>> import factorial_calculator as fc
    #   >>> fc.is_positive_number("100")
    #   True
    #   >>> fc.is_positive_number("0")
    #   False
    #   >>> fc.is_positive_number("-10")
    #   False
    #   >>> fc.is_positive_number("abc")
    #   False
    # '''
    try:
        # ===Modify codes below=============
        # 시작전 반드시 'pass'를 지울 것
        integer_value = int(integer_str_value)
        if integer_value > 0:
            return True
        else:
            return False
        # ==================================
    except ValueError:
        return False


def main():
    # ===Modify codes below=============
    user_input = input("Input a positive number : ")
    while user_input is not "0":
        if is_positive_number(integer_str_value = user_input) == True:
            print(get_factorial_value(integer_value = int(user_input)))
        else:
            print("Input again, Please")
        user_input = input("Input a positive number : ")
    print("Thank you for using this program")
    # ==================================

if __name__ == "__main__":
    main()
