// Rust/calculator.rs
use std::collections::HashMap;
use std::io::{self, Write};

#[derive(Debug, Clone, PartialEq)]
enum Token {
    Number(i32),
    Variable(String),
    Plus,
    Minus,
    Multiply,
    Divide,
    Power,
    LParen,
    RParen,
    EOF,
}

struct Lexer {
    input: Vec<char>,
    pos: usize,
}

impl Lexer {
    fn new(input: &str) -> Self {
        Lexer {
            input: input.chars().collect(),
            pos: 0,
        }
    }

    fn next_token(&mut self) -> Token {
        while self.pos < self.input.len() && self.input[self.pos].is_whitespace() {
            self.pos += 1;
        }

        if self.pos >= self.input.len() {
            return Token::EOF;
        }

        match self.input[self.pos] {
            '+' => {
                self.pos += 1;
                Token::Plus
            }
            '-' => {
                self.pos += 1;
                Token::Minus
            }
            '*' => {
                self.pos += 1;
                Token::Multiply
            }
            '/' => {
                self.pos += 1;
                Token::Divide
            }
            '^' => {
                self.pos += 1;
                Token::Power
            }
            '(' => {
                self.pos += 1;
                Token::LParen
            }
            ')' => {
                self.pos += 1;
                Token::RParen
            }
            _ => {
                if self.input[self.pos].is_alphabetic() {
                    let mut var = String::new();
                    while self.pos < self.input.len()
                        && self.input[self.pos].is_alphanumeric()
                    {
                        var.push(self.input[self.pos]);
                        self.pos += 1;
                    }
                    Token::Variable(var)
                } else if self.input[self.pos].is_digit(10) {
                    let mut num = 0;
                    while self.pos < self.input.len() && self.input[self.pos].is_digit(10) {
                        num = num * 10 + self.input[self.pos].to_digit(10).unwrap() as i32;
                        self.pos += 1;
                    }
                    Token::Number(num)
                } else {
                    panic!("Geçersiz karakter: {}", self.input[self.pos])
                }
            }
        }
    }
}

struct Parser {
    lexer: Lexer,
    current_token: Token,
}

impl Parser {
    fn new(mut lexer: Lexer) -> Self {
        let current_token = lexer.next_token();
        Parser { lexer, current_token }
    }

    fn eat(&mut self, token: Token) {
        if self.current_token == token {
            self.current_token = self.lexer.next_token();
        } else {
            panic!("bilinmeyen işlem: {:?}", self.current_token);
        }
    }

    fn factor(&mut self, vars: &HashMap<String, i32>) -> i32 {
        let mut result = self.primary(vars);
        while self.current_token == Token::Power {
            self.eat(Token::Power);
            let exp = self.primary(vars);
            result = result.pow(exp as u32);
        }
        result
    }

    fn primary(&mut self, vars: &HashMap<String, i32>) -> i32 {
        match &self.current_token {
            Token::Number(n) => {
                let val = *n;
                self.eat(Token::Number(*n));
                val
            }
            Token::Variable(name) => {
                let val = *vars.get(name).expect("bilinmeyen değişken");
                self.eat(Token::Variable(name.clone()));
                val
            }
            Token::LParen => {
                self.eat(Token::LParen);
                let result = self.expr(vars);
                self.eat(Token::RParen);
                result
            }
            _ => panic!("bilinmeyen işlem: {:?}", self.current_token),
        }
    }

    fn term(&mut self, vars: &HashMap<String, i32>) -> i32 {
        let mut result = self.factor(vars);
        while vec![Token::Multiply, Token::Divide].contains(&self.current_token) {
            match self.current_token {
                Token::Multiply => {
                    self.eat(Token::Multiply);
                    result *= self.factor(vars);
                }
                Token::Divide => {
                    self.eat(Token::Divide);
                    result /= self.factor(vars);
                }
                _ => break,
            }
        }
        result
    }

    fn expr(&mut self, vars: &HashMap<String, i32>) -> i32 {
        let mut result = self.term(vars);
        while vec![Token::Plus, Token::Minus].contains(&self.current_token) {
            match self.current_token {
                Token::Plus => {
                    self.eat(Token::Plus);
                    result += self.term(vars);
                }
                Token::Minus => {
                    self.eat(Token::Minus);
                    result -= self.term(vars);
                }
                _ => break,
            }
        }
        result
    }

    fn parse(&mut self, vars: &HashMap<String, i32>) -> i32 {
        let result = self.expr(vars);
        self.eat(Token::EOF);
        result
    }
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let mut variables: HashMap<String, i32> = HashMap::new();
    
    loop {
        print!("İşlem giriniz: ");
        io::stdout().flush().unwrap();

        let mut input = String::new();
        io::stdin().read_line(&mut input)?;
        let input = input.trim();

        if input.is_empty() {
            continue;
        }

        if let Some(eq_pos) = input.find('=') {
            let var = input[..eq_pos].trim().to_string();
            let expr = input[eq_pos+1..].trim();
            
            let lexer = Lexer::new(expr);
            let mut parser = Parser::new(lexer);
            let value = parser.parse(&variables);
            
            variables.insert(var, value);
        } else {
            let lexer = Lexer::new(input);
            let mut parser = Parser::new(lexer);
            let result = parser.parse(&variables);
            println!("{}", result);
        }
    }
}