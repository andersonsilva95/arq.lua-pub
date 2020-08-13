-- AI_Gaint_BackGround.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Giant_Wait.frm",
        Func    = "Gaint_BackGround_WaitFunc",

        Trigger =
        {
            -- ����ũ~
            {
                AICheckFrame        = 300,
                AIFunc              = "Gaint_BackGround_Check_Attack01",
                DelayFrame          = 400,
            },
        },
    },
    
    -- ����ũ
    {
        ID      = "ATTACK01",
        Motion  = "Giant_Attack01.frm",
        Func    = "Gaint_BackGround_Attack01Func",
    },
}

CallBack =
{
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGaint_BackGround( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetInvincible( true )
    pMonster:SetIsRight( true )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( false )
    pMonster:SetFly( true )
    pMonster:SetX( 2.25 )
    pMonster:SetY( 0.2 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Gaint_BackGround_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetInvincible( true )
	end
	
	if( iFrame == 2 ) then
		if( pMonster:FloatRand() < 0.33 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- �߸� ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- �Ȳ�ġ ����
		elseif( pMonster:FloatRand() < 0.66 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- �߸� ����
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 6, 0, 0, posx, -0.1 )		-- ��
		elseif( pMonster:FloatRand() < 0.99 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- �Ȳ�ġ ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- �ո� ��
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- �ո� ����
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Gaint_BackGround_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:StartText("DANGER")
		pMonster:SetInvincible( true )
    elseif( iFrame == 70 ) then
		pMonster:EarthQuake( 30, 0.06, 0.02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function Gaint_BackGround_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "ATTACK01" )
	pMonster:ResetDelay()
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------