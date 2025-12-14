" ============================================================
" sql.vim — SQL + dbt Jinja highlighting
" ============================================================
" This is an after/syntax file - it loads AFTER built-in SQL syntax
" We must clear and redefine to get proper Jinja handling

" Unlet the current syntax to allow redefinition
if exists("b:current_syntax")
  unlet b:current_syntax
endif

" Clear all existing syntax
syntax clear

syntax case ignore

" ============================================================
" CRITICAL: Force sync from start to prevent cursor-based breaks
" ============================================================
syntax sync fromstart
syntax sync minlines=100

" ============================================================
" JINJA REGIONS — HIGHEST PRIORITY (defined first)
" These must be completely opaque to SQL syntax
" ============================================================

" Jinja comments {# ... #}
syntax region dbtJinjaComment
      \ start="{#"
      \ end="#}"
      \ contains=@Spell,dbtJinjaTodo

" Jinja statements {% ... %}
syntax region dbtJinjaStatement
      \ matchgroup=dbtJinjaBrace
      \ start="{%"
      \ end="%}"
      \ contains=dbtJinjaKeyword,dbtJinjaFunction,dbtJinjaString,dbtJinjaNumber,dbtJinjaOperator,dbtJinjaVariable

" Jinja expressions {{ ... }}
syntax region dbtJinjaExpression
      \ matchgroup=dbtJinjaBrace
      \ start="{{"
      \ end="}}"
      \ contains=dbtJinjaFunction,dbtJinjaString,dbtJinjaNumber,dbtJinjaOperator,dbtJinjaVariable

" Todo items in comments
syntax keyword dbtJinjaTodo contained TODO FIXME XXX NOTE

" ============================================================
" JINJA INNER SYNTAX (only matches inside Jinja regions)
" ============================================================

" Strings inside Jinja
syntax region dbtJinjaString
      \ start=+'+ end=+'+ skip=+\\'+ contained
syntax region dbtJinjaString
      \ start=+"+ end=+"+ skip=+\\"+ contained

" Jinja keywords
syntax keyword dbtJinjaKeyword contained
      \ if else elif endif not
      \ for endfor in
      \ set do endset
      \ macro endmacro materialization endmaterialization
      \ test endtest
      \ call endcall
      \ with endwith
      \ block endblock extends
      \ import from as
      \ include

" Jinja operators and filters
syntax match dbtJinjaOperator contained /|\s*\w\+/
syntax match dbtJinjaOperator contained /[+\-*/%<>=!|]/

" Jinja numbers
syntax match dbtJinjaNumber contained /\<\d\+\>/

" Generic function calls (word followed by opening paren)
syntax match dbtJinjaFunction contained /\<\w\+\>\ze\s*(/

" dbt-specific functions (ref, source, config, etc.)
syntax keyword dbtJinjaFunction contained ref source config var env_var this target
syntax match dbtJinjaFunction contained /\<dbt_utils\.\w\+/
syntax match dbtJinjaFunction contained /\<adapter\.\w\+/

" Generic identifiers in Jinja (must be last, excludes function calls)
syntax match dbtJinjaVariable contained /\<\h\w*\>\(\s*(\)\@!/

" ============================================================
" SQL COMMENTS
" ============================================================

" Line comments: -- ...
syntax match dbtSqlLineComment /--.*$/ contains=dbtSqlTodo,@Spell

" Block comments: /* ... */
syntax region dbtSqlBlockComment
      \ start="/\*"
      \ end="\*/"
      \ contains=dbtSqlTodo,@Spell

syntax keyword dbtSqlTodo contained TODO FIXME XXX NOTE

" ============================================================
" SQL STRINGS
" These should NOT match inside Jinja regions or SQL comments
" ============================================================

" Single-quoted strings
syntax region dbtSqlString
      \ start=+'+ end=+'+ skip=+''+
      \ contains=@Spell

" Double-quoted identifiers
syntax region dbtSqlIdentifier
      \ start=+"+ end=+"+ skip=+""+

" ============================================================
" SQL KEYWORDS
" ============================================================

syntax keyword dbtSqlKeyword
      \ select from where group by having order
      \ join left right inner outer full cross natural
      \ on as distinct all any some
      \ union intersect except
      \ case when then else end
      \ limit offset fetch rows only
      \ qualify over partition window
      \ range unbounded preceding following current row
      \ insert into values update set delete merge
      \ create replace alter drop truncate rename
      \ table view materialized temporary temp transient
      \ schema database warehouse
      \ with recursive cte
      \ and or not null is in exists between like ilike rlike
      \ true false
      \ asc desc nulls first last
      \ using
      \ begin commit rollback transaction
      \ if exists cascade restrict

" ============================================================
" SQL FUNCTIONS
" ============================================================

" Match function calls: word followed by (
syntax match dbtSqlFunction /\<\w\+\>\s*(/me=e-1

" Common SQL functions (for better highlighting)
" NOTE: 'left', 'right', 'case', 'when', 'then', 'else', 'end' removed
" because they're SQL keywords that would conflict with JOIN/CASE syntax
syntax keyword dbtSqlFunction
      \ count sum avg min max least greatest
      \ coalesce nullif ifnull nvl
      \ cast convert
      \ substring substr length
      \ upper lower trim ltrim rtrim
      \ concat concat_ws
      \ now current_date current_timestamp
      \ date_trunc date_add date_sub datediff
      \ row_number rank dense_rank
      \ lag lead first_value last_value
      \ round floor ceil abs

" ============================================================
" SQL TYPES
" ============================================================

syntax keyword dbtSqlType
      \ int integer bigint smallint tinyint
      \ numeric decimal float double real
      \ boolean bool
      \ varchar char text string
      \ date datetime timestamp timestamptz time timetz
      \ json jsonb variant
      \ array struct map
      \ binary varbinary bytes
      \ number

" ============================================================
" SQL OPERATORS & SPECIAL
" ============================================================

syntax match dbtSqlOperator /\%(=\|<>\|!=\|<\|>\|<=\|>=\)/
syntax match dbtSqlOperator /\%(+\|-\|\*\|\/\|%\)/
syntax match dbtSqlSpecial /[(),;]/

" ============================================================
" NUMBERS
" ============================================================

syntax match dbtSqlNumber /\<\d\+\>/
syntax match dbtSqlNumber /\<\d\+\.\d\+\>/
syntax match dbtSqlNumber /\<\d\+[eE][+-]\?\d\+\>/
syntax match dbtSqlNumber /\<\d\+\.\d\+[eE][+-]\?\d\+\>/

" ============================================================
" IDENTIFIERS
" ============================================================

" Table/alias reference (the part before the dot in alias.column)
syntax match dbtSqlTableRef /\<\w\+\ze\.\w\+\>/

" Column name (the part after the dot in alias.column)
syntax match dbtSqlColumnName /\<\w\+\.\zs\w\+\>/

" Three-part qualified names (db.schema.table)
syntax match dbtSqlQualifiedName /\<\w\+\.\w\+\.\w\+\>/

" ============================================================
" HIGHLIGHT GROUPS
" ============================================================

" Jinja
hi def link dbtJinjaBrace Special
hi def link dbtJinjaComment Comment
hi def link dbtJinjaStatement PreProc
hi def link dbtJinjaExpression PreProc
hi def link dbtJinjaKeyword Keyword
hi def link dbtJinjaFunction Function
hi def link dbtJinjaVariable Identifier
hi def link dbtJinjaString String
hi def link dbtJinjaNumber Number
hi def link dbtJinjaOperator Operator
hi def link dbtJinjaTodo Todo

" SQL
hi def link dbtSqlLineComment Comment
hi def link dbtSqlBlockComment Comment
hi def link dbtSqlTodo Todo
hi def link dbtSqlString String
hi def link dbtSqlIdentifier Identifier
hi def link dbtSqlKeyword Keyword
hi def link dbtSqlFunction Function
hi def link dbtSqlType Type
hi def link dbtSqlNumber Number
hi def link dbtSqlOperator Operator
hi def link dbtSqlSpecial Special
hi def link dbtSqlQualifiedName Identifier

" Column references - distinct highlighting
hi def link dbtSqlTableRef Type
hi def link dbtSqlColumnName Identifier

let b:current_syntax = "sql"
