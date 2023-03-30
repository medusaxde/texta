///////////////////////////////////////////////////////////////////////
//   File: cevbase.hpp
//
// Author: $author$
//   Date: 4/3/2009
///////////////////////////////////////////////////////////////////////

#ifndef _CEVBASE_HPP
#define _CEVBASE_HPP

#include "evplatform.h"
#include "everror.h"

#if defined(WIN32) 
// Windows 
#define CTHIS
#else // defined(WIN32) 
// Unix 
#define CTHIS (*this).
#endif // defined(WIN32) 

///////////////////////////////////////////////////////////////////////
//  Class: CEvBase
//
// Author: $author$
//   Date: 4/3/2009
///////////////////////////////////////////////////////////////////////
class CEvBase
{
public:
    typedef CEvBase CDerives;

#if defined(__GNUC__) 
//
// Gcc
//
    ///////////////////////////////////////////////////////////////////////
    // Destructor: ~CEvBase
    //
    //      Author: $author$
    //        Date: 4/3/2009
    ///////////////////////////////////////////////////////////////////////
    virtual ~CEvBase()
    {
    }
#endif // defined(__GNUC__)
};
#endif // _CEVBASE_HPP
