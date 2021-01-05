// Enter your code for reversed_binary_value<bool...>
template<typename = void>
int reversed_binary_value () { return 0; }

template<bool bit, bool... other_bits>
int reversed_binary_value ()
{
    return bit + reversed_binary_value<other_bits...>() * 2;
}

////////////

template <bool... digits>
struct Solver;
    
template <bool Head, bool... Tail>
struct Solver<Head, Tail...>
{
    static int value()
    {
        return Head + 2 * Solver<Tail...>::value();
    }
};

template <>
struct Solver<>
{
    static int value()
    {
        return 0;
    }
};

template <bool... digits>
int reversed_binary_value()
{
    return Solver<digits...>::value();
}
