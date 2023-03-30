/*
 * yylexer.hxx
 *
 * $author$
 * 1/1/1998
 *
 * define interfaces for lexical analyzer classes
 * generated by bflex.
 *
 */

#ifndef YYLEXER_HXX
#define YYLEXER_HXX

#include <cstream.hxx>

struct yy_buffer_state;
typedef int yy_state_type;

class yyAnyLexer
{
public:
	virtual ~yyAnyLexer() { }

	virtual struct yy_buffer_state *yy_create_buffer( cStream* s, int size ) = 0;
	virtual void yy_delete_buffer( struct yy_buffer_state* b ) = 0;
	virtual void yy_switch_to_buffer( struct yy_buffer_state* new_buffer ) = 0;
	virtual void yyrestart( cStream* s ) = 0;

	// Switch to new input/output streams.  A nil stream pointer
	// indicates "keep the current one".
	virtual void yy_switch_streams( cStream* new_in = 0, cStream* new_out = 0 ) = 0;

    virtual int yyprintf( const char* format,...) = 0;
    virtual int yywrap() = 0;
	virtual int yylex() = 0;

	// Call yylex with new input/output sources.
	int yylex( cStream* new_in, cStream* new_out = 0 )
		{
		yy_switch_streams( new_in, new_out );
		return yylex();
		}

	const char* yy_text() const { return yytext; }
	int yy_leng() const { return yyleng; }
	int yy_lineno() const { return yylineno; }

	int yy_get_debug() const { return yy_flex_debug; }
	void yy_set_debug( int flag ) { yy_flex_debug = flag; }

protected:
	char* yytext;
	int yyleng;
	int yylineno;		// only maintained if you use %option yylineno
	int yy_flex_debug;	// only has effect with -d or "%option debug"
};

#endif

#ifndef yyLexerAgain
#define yyLexerAgain

class yyIsLexer : public yyAnyLexer 
{
public:
	// arg_yyin and arg_yyout default to the cin and cout, but we
	// only make that assignment when initializing in yylex().
	yyIsLexer( cStream* arg_yyin = 0, cStream* arg_yyout = 0 );
	virtual ~yyIsLexer();

	void yy_initialize( void );
	void yy_finish( void );
	void yy_reset( void );
	void *yy_save_scan_state( cStream *input_file );
	void yy_restore_scan_state( void *old_state );

	void yy_switch_to_buffer( struct yy_buffer_state* new_buffer );
	struct yy_buffer_state* yy_create_buffer( cStream* s, int size );
	void yy_delete_buffer( struct yy_buffer_state* b );
	void yyrestart( cStream* s );

	virtual void yy_switch_streams( cStream* new_in, cStream* new_out );
    virtual int yyprintf( const char* format, ... );
    virtual int yywrap();

protected:
	// Overridable input,output and error routines
	//
	virtual int yy_lexer_input( char* buf, int max_size );
	virtual void yy_lexer_output( const char* buf, int size );
	virtual void yy_lexer_error( const char* msg );

	void yyunput( int c, char* buf_ptr );
	int yyinput();

	void yy_load_buffer_state();
	void yy_init_buffer( struct yy_buffer_state* b, cStream* s );
	void yy_flush_buffer( struct yy_buffer_state* b );

	int yy_start_stack_ptr;
	int yy_start_stack_depth;
	int* yy_start_stack;

	void yy_push_state( int new_state );
	void yy_pop_state();
	int yy_top_state();

	yy_state_type yy_get_previous_state();
	yy_state_type yy_try_NUL_trans( yy_state_type current_state );
	int yy_get_next_buffer();

	cStream* yyin;	// input source for default yy_lexer_input
	cStream* yyout;	// output sink for default yy_lexer_output

	struct yy_buffer_state* yy_current_buffer;

	// yy_hold_char holds the character lost when yytext is formed.
	char yy_hold_char;

	// Number of characters read into yy_ch_buf.
	int yy_n_chars;

	// Points to current character in buffer.
	char* yy_c_buf_p;

	int yy_init;		// whether we need to initialize
	int yy_start;		// start state number

	// Flag which is used to allow yywrap()'s to do buffer switches
	// instead of setting up a fresh yyin.  A bit of a hack ...
	int yy_did_buffer_switch_on_eof;

	// The following are not always needed, but may be depending
	// on use of certain flex features (like REJECT or yymore()).

	yy_state_type yy_last_accepting_state;
	char* yy_last_accepting_cpos;

	yy_state_type* yy_state_buf;
	yy_state_type* yy_state_ptr;

	char* yy_full_match;
	int* yy_full_state;
	int yy_full_lp;

	int yy_lp;
	int yy_looking_for_trail_begin;

	int yy_more_flag;
	int yy_more_len;
};

class yyLexer : public yyIsLexer 
{
public:
	yyLexer( cStream* arg_yyin = 0, cStream* arg_yyout = 0 )
	:yyIsLexer(arg_yyin,arg_yyout){}

	virtual int yylex();
};

#endif

