#ifndef MINI_UART_H
#define MINI_UART_H
void uart_init(void);
void uart_send ( char c );
char uart_recv ( void );
void uart_send_string(char* str);
#endif /* MINI_UART_H */