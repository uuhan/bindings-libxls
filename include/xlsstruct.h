/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 * This file is part of libxls -- A multiplatform, C library
 * for parsing Excel(TM) files.
 *
 * libxls is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * libxls is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with libxls.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright 2004 Komarov Valery
 * Copyright 2006-2009 Christophe Leitienne
 * Copyright 2008-2009 David Hoerl
 */

#include "ole.h"

typedef struct 
{
    WORD id;
    WORD size;
}
BOF;

typedef struct 
{
    WORD ver;
    WORD type;
    WORD id_make;
    WORD year;
    DWORD flags;
    DWORD min_ver;
    BYTE buf[100];
}
BIFF;

typedef struct 
{
    WORD xWn;
    WORD yWn;
    WORD dxWn;
    WORD dyWn;
    WORD grbit;
    WORD itabCur;
    WORD itabFirst;
    WORD ctabSel;
    WORD wTabRatio;
}
WIND1;

typedef struct 
{
    DWORD	filepos;
    BYTE	type;
    BYTE	visible;
    BYTE	name[];
}
BOUNDSHEET;

typedef struct 
{
    WORD	index;
    WORD	fcell;
    WORD	lcell;
    WORD	height;
    WORD	notused;
    WORD	notused2; //used only for BIFF3-4
    WORD	flags;
    WORD	xf;
}
ROW;

typedef struct 
{
    WORD	row;
    WORD	col;
    WORD	xf;
}
COL;


typedef struct  // BIFF8
{
    WORD	row;
    WORD	col;
    WORD	xf;
    //	ULLONG  res;
    BYTE	resid;
    BYTE	resdata[5];
    WORD	res;
    //	double	res;
    WORD	flags;
    BYTE	chn[4]; // BIFF8
    WORD	len;
    BYTE	value[1]; //var
}
FORMULA;

typedef struct 
{
    WORD	row;
    WORD	col;
    WORD	xf;
    BYTE	value[1]; // var
}
RK;

typedef struct 
{
    WORD	row;
    WORD	col;
    WORD	xf;
    BYTE	value[1];
}
LABELSST;

typedef struct 
{
    WORD	row;
    WORD	col;
    WORD	xf;
}
BLANK;

typedef struct 
{
    WORD	row;
    WORD	col;
    WORD	xf;
    BYTE	value[1]; // var
}
LABEL;

typedef struct 
{
    DWORD	num;
    DWORD	numofstr;
    BYTE	strings;
}
SST;

typedef struct 
{
    WORD	font;
    WORD	format;
    WORD	type;
    WORD	align;
    WORD	color;
    WORD	fill;
    WORD	border;
    WORD	linestyle;
}
XF5;

typedef struct 
{
    WORD	font;
    WORD	format;
    WORD	type;
    BYTE	align;
    BYTE	rotation;
    BYTE	ident;
    BYTE	usedattr;
    DWORD	linestyle;
    DWORD	linecolor;
    WORD	groundcolor;
}
XF8;

typedef struct 
{
    WORD	row;
    WORD	col;
    WORD	xf;
    double value;
}
BR_NUMBER;

typedef struct 
{
    WORD	first;
    WORD	last;
    WORD	width;
    WORD	xf;
    WORD	flags;
    WORD	notused;
}
COLINFO;

typedef struct 
{
    WORD	rowf;
    WORD	rowl;
    WORD	colf;
    WORD	coll;
}
MERGEDCELLS;

typedef struct 
{
    WORD	height;
    WORD	flag;
    WORD	color;
    WORD	bold;
    WORD	escapement;
    BYTE	underline;
    BYTE	family;
    BYTE	charset;
    BYTE	notused;
    BYTE	name;
}
FONT;

typedef struct 
{
    WORD	index;
    BYTE	value[0];
}
FORMAT;

//---------------------------------------------------------
typedef struct 
{
    DWORD filepos;
    BYTE visibility;
    BYTE type;
    char* name;
}st_sheet_data;
typedef struct 
{
    DWORD count;        //Count of sheets
    st_sheet_data* sheet;
}
st_sheet;

typedef struct 
{
    WORD	height;
    WORD	flag;
    WORD	color;
    WORD	bold;
    WORD	escapement;
    BYTE	underline;
    BYTE	family;
    BYTE	charset;
    char*	name;
}st_font_data;

typedef struct 
{
    DWORD count;		//Count of FONT's
    st_font_data* font;
}
st_font;

typedef struct 
{
     WORD index;
     char *value;
}st_format_data;

typedef struct 
{
    DWORD count;		//Count of FORMAT's
    st_format_data* format;
}
st_format;

typedef struct 
{
    WORD	font;
    WORD	format;
    WORD	type;
    BYTE	align;
    BYTE	rotation;
    BYTE	ident;
    BYTE	usedattr;
    DWORD	linestyle;
    DWORD	linecolor;
    WORD	groundcolor;
} st_xf_data;

typedef struct 
{
    DWORD count;	//Count of XF
    //	XF** xf;
    st_xf_data xf;
}
st_xf;

typedef struct 
{
    //	long len;
    char* str;
} str_sst_string;


typedef struct 
{
    DWORD count;
    DWORD lastid;
    DWORD continued;
    DWORD lastln;
    DWORD lastrt;
    DWORD lastsz;
    str_sst_string* string;
}
st_sst;

typedef struct 
{
    WORD	id;
    WORD	row;
    WORD	col;
    WORD	xf;
    double	d;
    long	l;
    char*	str;		//String value;
    BYTE	ishiden;	//Is cell hidden
    WORD	width;		//Width of col
    WORD	colspan;
    WORD	rowspan;
} st_cell_data;


typedef struct 
{
    DWORD count;
    st_cell_data* cell;
}
st_cell;

typedef struct 
{
    WORD index;
    WORD fcell;
    WORD lcell;
    WORD height;
    WORD flags;
    WORD xf;
    BYTE xfflags;
    st_cell cells;
} st_row_data;

typedef struct 
{
    //	DWORD count;
    WORD lastcol;
    WORD lastrow;
    st_row_data* row;
}
st_row;

typedef struct 
{
    WORD	first;
    WORD	last;
    WORD	width;
    WORD	xf;
    WORD	flags;
}st_colinfo_data;

typedef struct 
{
    DWORD count;	//Count of COLINFO
    st_colinfo_data* col;
}
st_colinfo;

typedef struct 
{
    //FILE*		file;		//
    OLE2Stream*	olestr;
    long		filepos;	//position in file

    //From Header (BIFF)
    BYTE		is5ver;
    WORD		type;

    //Other data
    WORD		codepage;	//Charset codepage
    char*		charset;
    st_sheet	sheets;
    st_sst		sst;		//SST table
    st_xf		xfs;		//XF table
    st_font		fonts;
    st_format	formats;	//FORMAT table

	char		*summary;		// ole file
	char		*docSummary;	// ole file
}
xlsWorkBook;

typedef struct 
{
    DWORD		filepos;
    WORD		defcolwidth;
    st_row		rows;
    xlsWorkBook * 	workbook;
    st_colinfo	colinfo;
    WORD		maxcol;
}
xlsWorkSheet;

typedef st_cell_data xlsCell;
typedef st_row_data xlsRow;

typedef struct 
{
	char		*title;
	char		*subject;
	char		*author;
	char		*keywords;
	char		*comment;
	char		*lastAuthor;
	char		*appName;
	char		*category;
	char		*manager;
	char		*company;
}
xlsSummaryInfo;
