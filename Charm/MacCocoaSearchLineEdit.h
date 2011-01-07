#ifndef MACCOCOASEARCHLINEEDIT_H
#define MACCOCOASEARCHLINEEDIT_H

#include <QMacCocoaViewContainer>

class MacCocoaSearchLineEdit : public QMacCocoaViewContainer
{
    Q_OBJECT
public:
    MacCocoaSearchLineEdit( QWidget *parent = 0 );
    QSize sizeHint() const;
    // This method to be public due to lack of friend classes in Objective-C and
    // the lack inheritance of Objective-C classes from C++ ones.
    void textChangedEvent( const QString &text );

public slots:
    void clear();

signals:
    void textChanged( const QString &text );
};

#endif
