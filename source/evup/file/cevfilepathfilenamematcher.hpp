///////////////////////////////////////////////////////////////////////
//   File: cevfilepathfilenamematcher.hpp
//
// Author: $author$
//   Date: 5/21/2009
///////////////////////////////////////////////////////////////////////

#ifndef _CEVFILEPATHFILENAMEMATCHER_HPP
#define _CEVFILEPATHFILENAMEMATCHER_HPP

#include "cevfilepathmatcher.hpp"

///////////////////////////////////////////////////////////////////////
//  Class: CEvFilePathFilenameMatcher
//
// Author: $author$
//   Date: 5/21/2009
///////////////////////////////////////////////////////////////////////
class CEvFilePathFilenameMatcher
: public CEvFilePathMatcher
{
public:
    typedef CEvFilePathMatcher CExtends;
    typedef CEvFilePathFilenameMatcher CDerives;
    ///////////////////////////////////////////////////////////////////////
    // Constructor: CEvFilePathFilenameMatcher
    //
    //       Author: $author$
    //         Date: 5/21/2009
    ///////////////////////////////////////////////////////////////////////
    CEvFilePathFilenameMatcher
    (const char* chars=0, LONG length=-1)
    : CExtends(chars, length) 
    {
    }
    ///////////////////////////////////////////////////////////////////////
    // Function: Matches
    //
    //   Author: $author$
    //     Date: 5/21/2009
    ///////////////////////////////////////////////////////////////////////
    virtual bool Matches
    (const EvFilePath& path, bool ignoreCase=false) 
    {
        bool does = false;
        const char* chars;
        LONG length;
        if ((chars = path.GetFileName(length)) && (0 < length))
            does = MatchesChars(chars, length, ignoreCase);
        return does;
    }
    ///////////////////////////////////////////////////////////////////////
    // Function: DeleteInstance
    //
    //   Author: $author$
    //     Date: 5/21/2009
    ///////////////////////////////////////////////////////////////////////
    virtual EvError DeleteInstance() 
    {
        EvError error = EV_ERROR_NONE;
        delete this;
        return error;
    }
};
#endif // _CEVFILEPATHFILENAMEMATCHER_HPP
