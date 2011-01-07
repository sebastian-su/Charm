#include "MacCocoaSearchLineEdit.h"

#include <QApplication>

#include <QDebug>
#include <QMenu>
#include <QHBoxLayout>

@interface TextChangedHandler : NSObject
{
@public
    MacCocoaSearchLineEdit* macCocoaSearchLineEdit;
}
- (void)textDidChange:(NSNotification *)notification;
@end

@implementation TextChangedHandler
- (void)textDidChange:(NSNotification*)notification {
    if (macCocoaSearchLineEdit)
        macCocoaSearchLineEdit->textChangedEvent("test");
}
@end

MacCocoaSearchLineEdit::MacCocoaSearchLineEdit( QWidget *parent )
    : QMacCocoaViewContainer( 0, parent )
{
    // Many Cocoa objects create temporary autorelease objects,
    // so create a pool to catch them.
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // Create the NSSearchField, set it on the QCocoaViewContainer.
    NSSearchField *search = [[NSSearchField alloc] init];

    setCocoaView(search);

    // Release our reference, since our super class takes ownership and we
    // don't need it anymore.
    [search release];

    // Clean up our pool as we no longer need it.
    [pool release];

    // For some reason I need to set these or get bad memory access
    setLayoutDirection( QApplication::layoutDirection() );
    setLocale( QLocale::system() );
}

QSize MacCocoaSearchLineEdit::sizeHint() const
{
    return QSize(150, 40);
}

void MacCocoaSearchLineEdit::textChangedEvent( const QString &text )
{

}

void MacCocoaSearchLineEdit::clear()
{
    qDebug() << "MacCocoaSearchLineEdit::clear";
}

#include "MacCocoaSearchLineEdit.moc"
